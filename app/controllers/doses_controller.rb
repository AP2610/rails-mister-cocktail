class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # raise
  end

  def create
    @dose = Dose.new(accepted_params)

    # Always remember, when you have a many to many relationship, or a 1 to many
    # you have to add the association. In this case you need to
    # associate a dose with a cocktail, that's why we need to find the cocktail
    cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = cocktail

    if @dose.save
      redirect_to cocktail_path(cocktail)
    else
      render :new
    end
    # raise
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete

    @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to cocktail_path(@cocktail)
  end

  private

  def accepted_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end

# <%= link_to "Go back", cocktail_path(@cocktail) %>

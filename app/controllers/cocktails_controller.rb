class CocktailsController < ApplicationController

  # After defining your first route (usually listing all of a particular model)
  # go ahead and create a controller like we've done here. After that, make sure
  # to code the corresponding controller action. DONT FORGET ABOUT THE VIEW.
  # After coding the action, go ahead and make the corresponding view. Remember,
  # the view name should be the same as the name of its corresponding action.
  # Also remember, certain actions don't have their own view, but will redirect
  # to another view i.e. create or update or delete.
  def index
    @cocktails = Cocktail.all
  end

  # <p><%= link_to cocktail.name, cocktail_path(cocktail.id) %></p>

  def show
    find_cocktail
    @ingredients = @cocktail.ingredients
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(accepted_params)

    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def accepted_params
    params.require(:cocktail).permit(:name, :photo)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end

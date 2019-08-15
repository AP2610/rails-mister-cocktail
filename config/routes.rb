Rails.application.routes.draw do

  resources :cocktails do
    resources :doses, only: [:new, :create, :destroy]
  end

  # Make your first route, the path will start from the controller which holds
  # The corresponding action. Once you've made your route, go ahead and
  # make the corresponding controller (if you haven't already) and the
  # corresponding controller action!

  # A user can add a new dose which is an ingreident/description pair to a cocktail
  # Logically, this should be done from a single cocktail's page
  # so we need to have a button linking to a form on our
  # show page which allows the addition of a dose
  # get 'cocktails/:cocktail_id/doses/new', to: 'doses#new', as: 'new_cocktail_dose'

  # post 'cocktails/:cocktail_id/doses', to: 'doses#create', as: 'cocktail_doses'

  # # A user should be able to delete a dose once it has been added to a cocktail
  # delete 'doses/:id', to: 'doses#destroy', as: 'destroy'

  # # A user can create a new cocktail in 2 steps
  # # first, they need to fill up a form on a new page
  # # then they have to click on the create button
  # # This should trigger a post request to post the
  # # new cocktail to the cocktails db

  # get 'cocktails/new', to: 'cocktails#new'
  # post 'cocktails', to: 'cocktails#create'

  # # A user can see a list of all cocktails
  # get 'cocktails', to: 'cocktails#index'

  # # A user can see an individual cocktail's details by clicking on it from the
  # # list
  # get 'cocktails/:id', to: 'cocktails#show', as: 'cocktail'

end

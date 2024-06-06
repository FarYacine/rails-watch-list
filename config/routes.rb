Rails.application.routes.draw do
  resources :lists, only: [:index, :show, :new, :create, :destroy] do
    # lists/:id/bookmarks/new
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: :destroy
    # index: Voir toutes les listes de films.
    # show: Voir les détails d'une liste de films.
    # new: Formulaire pour créer une nouvelle liste de films.
    # create: Action pour créer une nouvelle liste de films.
    # create: Ajouter un film (bookmark) à une liste de films.
    # destroy: Détruire un bookmark.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end

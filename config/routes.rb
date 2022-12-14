Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: %i[create]
  end

  resources :plants, only: %i[edit update destroy] do
    resources :plant_tags, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end

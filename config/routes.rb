Raccoon::Application.routes.draw do
  resources :recipes

  namespace :api do
    namespace :v1  do
      resources :recipes, only: [:index]
    end
  end
end

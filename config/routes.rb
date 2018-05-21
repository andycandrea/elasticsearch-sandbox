Rails.application.routes.draw do
  resources :authorships
  resources :authors
  resources :categories
  resources :articles do
    collection do
      get :search
    end
  end

  get '/search', to: 'search#index', as: 'search'

  root to: 'search#index'
end

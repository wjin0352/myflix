Myflix::Application.routes.draw do
  root to: "videos#index"

  get 'ui(/:action)', controller: 'ui'

  get 'home', to: 'videos#index'

  resources :categories, only: [:show]

  resources :videos do
    collection do
      get :search
    end
  end



end

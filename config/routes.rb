Mafia::Application.routes.draw do
  devise_for :users

  resources :games do
    resources :appointments do
      post :create_bunch, on: :collection
      member do

        delete 'destroy_all'
      end
    end
  end
  root :to => 'games#index'
end

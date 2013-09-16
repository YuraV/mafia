Mafia::Application.routes.draw do
  devise_for :users

  resources :games do
    resources :appointments do
      collection do
        post :create_bunch
        put :put_roles
      end

      member do
        get :set_role
        delete 'destroy_all'
      end
    end
  end
  root :to => 'games#index'
end

Mafia::Application.routes.draw do
  devise_for :users

  resources :games do
    get :best_player
    resources :appointments do
      collection do
        post :create_bunch
        put :put_roles
        put :set_score
      end

      member do
        #get :score
        get :set_role
        delete 'destroy_all'
      end
    end
  end
  resources :scores

  root :to => 'games#index'
end

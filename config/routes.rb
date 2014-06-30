Mafia::Application.routes.draw do

  devise_for :users, :path_prefix => 'my'
  resources :users do
    resources :player_roles
  end

  resources :games do
    get :best_player
    resources :rounds
    resources :players do
      collection do
        post :create_bunch
        put :put_roles
        put :put_remarks
      end

      member do
        #get :score
        get :set_role
        delete :destroy_all
        get :get_remarks
      end
    end
  end

  resources :scores
  root :to => 'games#index'
end

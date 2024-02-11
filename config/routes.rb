Rails.application.routes.draw do
  # devise_for :users
 
 devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations',
      passwords: 'users/passwords'
  }
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'new' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  devise_scope :user do
    authenticated :user do
       get '/users/sign_out' => 'users/sessions#destroy'
       root 'home#index', as: :authenticated_root
    end
    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end	
	resources :app_users
	resources :shipments
  post '/app_users/:id/onboard', to: 'app_users#onboard', as: 'onboard_app_users'
  post '/app_users/:id/offboard', to: 'app_users#offboard', as: 'offboard_app_users'

end

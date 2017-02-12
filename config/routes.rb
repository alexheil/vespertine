Rails.application.routes.draw do
	
	root 'static_pages#home'

	devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get "sign_out", to: "users/sessions#destroy"
    get "sign_in", to: "users/sessions#new"
    get "register", to: "users/registrations#new"
  end

  resources :users, controller: 'users/users', only: [:show, :index] do
    resource :profile, controller: 'users/profiles', only: [:edit, :update]
  end

end
Rails.application.routes.draw do
 root "static_pages#home"
 post "sign_up", to: "users#create"
 get "sign_up", to: "users#new"
 post "login", to: "sessions#create"
 get '/auth/:provider/callback' => 'sessions#omniauth'

 delete "logout", to: "sessions#destroy"
 get "login", to: "sessions#new"

 put "account", to: "users#update"
 get "account", to: "users#edit"
 delete "account", to: "users#destroy"


 resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
 resources :passwords, only: [:create, :edit, :new, :update], param: :password_reset_token
 resources :article 

 resources :active_sessions, only: [:destroy] do
  collection do
    delete "destroy_all"
  end
 end

end

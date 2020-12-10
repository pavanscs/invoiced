Rails.application.routes.draw do

  resources :unlock_accounts, controller: 'rails_jwt_auth/unlock_accounts', only: %i[update]
  
  resources :invitations, controller: 'rails_jwt_auth/invitations', only: [:show, :create, :update]
  
  resources :reset_passwords, controller: 'rails_jwt_auth/reset_passwords', only: [:show, :create, :update]
  
  resources :confirmations, controller: 'rails_jwt_auth/confirmations', only: [:create, :update]
  
  resource :profile, controller: 'rails_jwt_auth/profiles', only: %i[show update] do
    collection do
      put :email
      put :password
    end
  end
  
  resource :registration, controller: 'registrations', only: [:create, :destroy] 
  
  # resource :registration, controller: 'registrations/registrations', only: [:create, :destroy]
  
  resource :session, controller: 'rails_jwt_auth/sessions', only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :v1 do
  	resources :contact
  end

  
end

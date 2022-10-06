Rails.application.routes.draw do 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "transaction/balance"
  post "transaction/balance"
  
  get "transaction/deposit"
  post "transaction/deposit"
  
  get "transaction/withdraw"
  post "transaction/withdraw"
  
  
  resources :atms do
    collection do
      post "balance"
    end
    collection do
      post "deposit"
    end
  end

  post "card/save"
  post "card/update_amount"
  resources :accounts do
    member do
      post "generate_bank_card"
    end
  end
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  #devise_for :users
  #get 'home/index'
  get 'home/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

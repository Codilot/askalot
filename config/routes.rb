Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  
  root 'pages#landing_page'
  get  'pages/index' => 'pages#index'
  patch 'pages#landing_page', to: 'users#update_expertise', as: :user
  #get 'pages/landing_page' => 'pages#landing_page'

  devise_for :users, skip: [:sessions]
  devise_scope :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    match 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
  end
  
  resources :users, only: [:update_expertise]
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

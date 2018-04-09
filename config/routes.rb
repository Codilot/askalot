Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  
  root 'pages#landing_page'
  get  'pages/index' => 'pages#index'
  patch 'pages#landing_page', to: 'users#update_expertise', as: :user
  #get 'pages/landing_page' => 'pages#landing_page'

  devise_for :users, controllers: { sessions: 'sessions' }
  
  resources :users, only: [:update_expertise]
  
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

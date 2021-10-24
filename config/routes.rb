Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create] do
  resources :notes, only: [:new,:create,:show,:edit] do
    resources :comments, only: [:new,:create,:edit]
    end
  resources :subjects, only: [:show]
  end

  resources :families, only: [:new,:create,:show,:edit,:update]
# patch 'add_family_user' ,to: 'families#????'  
  
  
end
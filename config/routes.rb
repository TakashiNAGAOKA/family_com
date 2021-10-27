Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create] do
  resources :notes, only: [:new,:create,:show,:edit]
  resources :subjects, only: [:show]
  end

  post '/users/:user_id/notes/:id', to: 'comments#create', as: 'comment'

  resources :families, only: [:new,:create,:show]
# patch 'add_family_user' ,to: 'families#????'  
  
  
end
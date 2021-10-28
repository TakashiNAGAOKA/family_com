Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'signup', to: 'users#new'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :create] 
  resources :notes, only: [:new,:create,:show]
  resources :comments, only: [:create,:destroy]

#  post '/users/:user_id/notes/:id', to: 'comments#create', as: 'comments'
#  delete '/users/:user_id/notes/:id', to: 'comments#destroy', as: 'comments'

  resources :families, only: [:new,:create,:show]
# patch 'add_family_user' ,to: 'families#????'  
  
end
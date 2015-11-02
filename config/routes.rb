Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'

  #resources :users, shallow: true do
  #  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
  #  end
  #end

end

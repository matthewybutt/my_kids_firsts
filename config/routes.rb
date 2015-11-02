Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  #resources :users, shallow: true do
  #  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
  #  end
  #end

end

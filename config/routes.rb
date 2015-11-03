Rails.application.routes.draw do
  root 'welcome#index'
  resources :users, only: [:index, :new, :edit, :create, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  resources :children, only: [:index, :show, :new, :edit, :create, :update, :destroy]


  get '/login', to: 'sessions#new'
  get '/signup', to: 'users#new'
  get '/account', to: 'users#edit'
  #resources :users, shallow: true do
  #  resources :posts, only: [:index, :show, :new, :edit, :create, :update, :destroy] do
  #  end
  #end

end

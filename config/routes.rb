Rails.application.routes.draw do
  get 'users/new'

  get 'users/create'

  root 'welcome#index'
end

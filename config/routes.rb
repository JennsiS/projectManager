Rails.application.routes.draw do
  resources :phases
  resources :projects
  resources :roles
  devise_for :users
  # get 'home/index'
  get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

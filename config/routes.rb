Rails.application.routes.draw do
  resources :projects_phases
  resources :users_projects
  resources :users_roles
  resources :important_dates
  resources :phases
  resources :projects
  resources :roles
  resources :users
  devise_for :users
  # get 'home/index'
  # get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  get '/all_project_phases/:project_id', to: 'projects#get_phases'
  get '/team_members/:project_id', to: 'projects#get_team'

end

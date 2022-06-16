Rails.application.routes.draw do
  resources :projects_phases
  resources :users_projects
  resources :users_roles
  resources :important_dates
  resources :phases
  resources :projects
  resources :roles
  resources :users
 # devise_for :users
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  # get 'home/index'
  # get 'home/about'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  
  get '/all_project_phases/:project_id', to: 'projects#get_phases'
  get '/team_members/:project_id', to: 'projects#get_team'
  get '/get_important_dates/:project_id', to: 'important_dates#get_dates_by_project'
  get '/get_team/:project_id/:phase_id', to: 'projects_phases#get_team_phases'
  get '/get_team/:project_id/', to: 'users_projects#get_members'
  get '/get_last_project', to: 'projects#get_last_id'

  get '/get_user_id/:email', to: 'users#get_user_id'

end

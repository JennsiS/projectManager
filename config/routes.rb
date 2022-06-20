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

  root 'home#index'

  get '/all_project_phases/:project_id', to: 'projects#get_phases'
  get '/team_members/:project_id', to: 'projects#get_team'
  get '/get_important_dates/:project_id', to: 'important_dates#get_dates_by_project'
  get '/get_last_project', to: 'projects#get_last_id'

  get '/get_project_manager/:project_id', to: 'users_projects#get_PM'


end

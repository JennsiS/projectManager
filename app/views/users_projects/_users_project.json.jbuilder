json.extract! users_project, :id, :user_id, :project_id, :rol_project_user, :created_at, :updated_at
json.url users_project_url(users_project, format: :json)

json.extract! project, :id, :title, :description, :start_date, :finish_date, :state, :created_at, :updated_at
json.url project_url(project, format: :json)

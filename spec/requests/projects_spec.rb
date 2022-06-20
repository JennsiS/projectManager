require 'rails_helper'

RSpec.describe "Projects", type: :request do
  it "GET projects" do
    get projects_path
    expect(response).to be_successful
  end

  it "POST a new Project" do
    post projects_path, params:{
      project:{
          title: "New project test 1",
          description: "New project",
          start_date: "2022-06-16",
          finish_date: "2022-07-22",
          state: "Beta",
          progress: "10%"
      }
    }
    expect(response).to have_http_status(:created)
  end



end

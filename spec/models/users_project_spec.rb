require 'rails_helper'

RSpec.describe UsersProject, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it "users_projects must have a project_id" do
    should validate_presence_of :project_id
  end

  it "users_projects must have a users_id" do 
    should validate_presence_of :user_id
  end
end

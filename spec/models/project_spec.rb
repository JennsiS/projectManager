require 'rails_helper'

RSpec.describe Project, type: :model do
  it "Projects must have a title" do
    should validate_presence_of :title
  end

  it "Projects can't have the same name" do
    should validate_uniqueness_of(:title).case_insensitive
  end 
  
  it "Projects must have start date" do 
    should validate_presence_of :start_date
  end

  it "Projects must have finish date" do 
    should validate_presence_of :finish_date
  end

  it { should have_many(:users) }
  it { should have_many(:important_dates).dependent(:delete_all) }
  it { should have_many(:projects_phases).dependent(:delete_all) }
  it { should have_many(:users_projects).dependent(:delete_all) }
  it { should have_many(:phases).dependent(:delete_all) }

  # it "The finish date must be greater than the start date" do
  #   project = create(:project)
  #   expect(project.start_date).to be <= project.finish_date
  # end
  
  

end

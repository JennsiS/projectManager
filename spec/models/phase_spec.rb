require 'rails_helper'

RSpec.describe Phase, type: :model do
  it "Phases must have a name" do
    should validate_presence_of :name
  end

  it "Phases must have start date" do 
    should validate_presence_of :start_date
  end

  it "Phases must have finish date" do 
    should validate_presence_of :finish_date
  end

  it { should have_many(:users) }
  it { should have_many(:projects).dependent(:delete_all) }
  it { should have_many(:projects_phases).dependent(:delete_all) }
end

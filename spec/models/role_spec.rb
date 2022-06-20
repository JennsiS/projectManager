require 'rails_helper'

RSpec.describe Role, type: :model do
  it { should have_many(:users_roles).dependent(:delete_all) }
  it { should have_many(:users)}
  it "Roles must have a name" do
    should validate_presence_of :name
  end
  it "Roles names must be unique" do
    should validate_uniqueness_of(:name).case_insensitive
  end 
end

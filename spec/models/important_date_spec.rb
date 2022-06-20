require 'rails_helper'

RSpec.describe ImportantDate, type: :model do
  it "Important date must have a name" do
    should validate_presence_of :name
  end

  it "Important date must have a date" do
    should validate_presence_of :date
  end

  it { should belong_to(:project) }
end

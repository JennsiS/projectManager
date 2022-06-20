require 'rails_helper'

RSpec.describe ProjectsPhase, type: :model do
  it { should belong_to(:project) }
  it { should belong_to(:user) }
  it { should belong_to(:phase) }
end

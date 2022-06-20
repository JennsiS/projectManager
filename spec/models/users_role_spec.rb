require 'rails_helper'

RSpec.describe UsersRole, type: :model do
  it { should belong_to(:role) }
  it { should belong_to(:user) }
end

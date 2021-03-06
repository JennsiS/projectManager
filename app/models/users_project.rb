class UsersProject < ApplicationRecord
  belongs_to :user
  belongs_to :project
  validates :user_id, presence: true #, uniqueness: true
  validates :project_id, presence: true #, uniqueness: true
end

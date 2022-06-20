class Role < ApplicationRecord
    has_many :users#, dependent: :delete_all
    has_many :users_roles, dependent: :delete_all
    has_many :users, through: :users_roles
    validates :name, presence: true, uniqueness: {case_sensitive: false}
end

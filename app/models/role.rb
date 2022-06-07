class Role < ApplicationRecord
    has_many :users, through: :users_roles
end

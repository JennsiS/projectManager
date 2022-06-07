class Phase < ApplicationRecord
    has_many :projects, through: :projects_phases
    has_many :users, through: :projects_phases
end

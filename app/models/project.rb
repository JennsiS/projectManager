class Project < ApplicationRecord
    has_many :important_dates
    has_many :users, through: :users_projects
    has_many :phases, through: :projects_phases
    has_many :users, through: :projects_phases
end

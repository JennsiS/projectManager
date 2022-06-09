class Project < ApplicationRecord
    has_many :important_dates
    has_many :users, through: :users_projects
    has_many :phases, through: :projects_phases
    has_many :users, through: :projects_phases
    validates :title, presence: true
    validates :title, uniqueness: {case_sensitive: false}
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :finish_date, comparison: { greater_than: :start_date }

end

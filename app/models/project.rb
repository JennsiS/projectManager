class Project < ApplicationRecord
    has_many :important_dates, dependent: :delete_all
    has_many :projects_phases, dependent: :delete_all
    has_many :users_projects, dependent: :delete_all
    has_many :users, through: :users_projects, dependent: :delete_all
    has_many :phases, through: :projects_phases, dependent: :delete_all
    has_many :users, through: :projects_phases, dependent: :delete_all
    validates :title, presence: true
    validates :title, uniqueness: {case_sensitive: false}
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :finish_date, comparison: { greater_than: :start_date }

end

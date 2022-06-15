class Phase < ApplicationRecord
    has_many :projects_phases
    has_many :projects, through: :projects_phases
    has_many :users, through: :projects_phases
    validates :name, presence: true
    validates :start_date, presence: true
    validates :finish_date, presence: true
    validates :finish_date, comparison: { greater_than: :start_date }
end

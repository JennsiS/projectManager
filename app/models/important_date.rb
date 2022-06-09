class ImportantDate < ApplicationRecord
    belongs_to :project
    validates :name, presence: true
    validates :date, presence: true
end

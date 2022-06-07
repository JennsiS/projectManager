class ProjectsPhase < ApplicationRecord
  belongs_to :user
  belongs_to :phase
  belongs_to :project
end

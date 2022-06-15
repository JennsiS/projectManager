class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_roles
  has_many :users_projects
  has_many :projects_phases
  has_many :roles, through: :users_roles
  has_many :projects, through: :users_projects
  has_many :phases, through: :projects_phases
  #validates :name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

end

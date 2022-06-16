class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_roles, dependent: :delete_all
  has_many :users_projects, dependent: :delete_all
  has_many :projects_phases, dependent: :delete_all
  has_many :roles, through: :users_roles
  has_many :projects, through: :users_projects
  has_many :phases, through: :projects_phases
  validates :email, presence: true, uniqueness: {case_sensitive: false}

end

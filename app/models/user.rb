class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :roles, through: :users_roles
  has_many :projects, through: :users_projects
  has_many :phases, through: :projects_phases

end

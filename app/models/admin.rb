class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
   self.update(role_id: 3)
  end
  
  def name
    self.first_name + self.last_name
  end

  belongs_to :role, optional: true
  has_many :projects, through: :employee_projects
  has_many :employee_projects, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :holidays, dependent: :destroy
end

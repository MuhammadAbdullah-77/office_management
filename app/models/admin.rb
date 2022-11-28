class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :address, :city, :country, presence: true, format: { with: /[a-z]+/i ,
  message: "only allows letters" }
  validates :phone_no, presence: true, uniqueness:true   
  validates :joining_date, :dob, presence: true
  validates :cnic, presence: true, format: { with: /[0-9]{5}-[0-9]{7}-[0-9]/, message: 'format is not correct' }, unless: -> { persisted? }
   
  after_create :assign_default_role
  scope :with_name, ->(search) { where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', "%#{ search }%", "%#{ search }%", "%#{ search }%") }

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

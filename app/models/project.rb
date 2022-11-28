class Project < ApplicationRecord 
    has_many :admins
    has_many :employee_projects, dependent: :destroy
    accepts_nested_attributes_for :employee_projects, reject_if: :all_blank, allow_destroy: true

    STATUSES = {inprogress: 0, completed: 1, archive: 2}
    enum status: STATUSES

    scope :with_title,->(search) { where('title LIKE ?', "%#{search}%")}
 end
  
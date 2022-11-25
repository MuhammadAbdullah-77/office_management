class EmployeeProject < ApplicationRecord
    belongs_to :project
    belongs_to :admin
  end
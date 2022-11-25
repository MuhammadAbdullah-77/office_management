class Role < ApplicationRecord
  has_many :admins

  NAME = ['Admin', 'Human Resource', 'employee']
  has_many :permissions, dependent: :destroy
  accepts_nested_attributes_for :permissions, update_only: true
end

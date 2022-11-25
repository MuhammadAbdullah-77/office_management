class Permission < ApplicationRecord
  ACTIONS_MAP = { admin: [:create, :show, :update, :delete],
                  project: [:create, :show, :update, :delete],
                  role:[:create, :show, :update, :delete],
                  attendance:[:create, :show, :update, :delete],
                  holiday:[:create, :show, :update, :delete]}
  belongs_to :role
end

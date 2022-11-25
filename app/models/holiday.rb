class Holiday < ApplicationRecord
    belongs_to :admin
    
    STATUSES = {pending: 0, approved: 1, rejected: 2}
    enum status: STATUSES

end

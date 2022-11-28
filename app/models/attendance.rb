class Attendance < ApplicationRecord
    validate :attendance_date
    validates :check_in, presence: true
    validates :time, presence: true


    belongs_to :admin


    def attendance_date
        if Attendance.find_by(date: self.date, admin_id: self.admin_id, check_in: self.check_in).present?
            errors.add(:date, "Today attendence is alreay marked")
        end
    end
    
end

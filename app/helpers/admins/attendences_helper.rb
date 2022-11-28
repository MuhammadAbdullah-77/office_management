module Admins::AttendencesHelper
    def display_date(date)
        return date.strftime('%B %e')
    end
end

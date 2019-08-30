class HeaderAttendanceMeeting < ApplicationRecord
  belongs_to :meeting

  def attendance_date
    super || Date.today
  end
end

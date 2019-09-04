class HeaderAttendanceMeeting < ApplicationRecord
  belongs_to :meeting
  has_many :person_attendance_meetings
  validates :topic, :total_attendees, :attendance_date, :prayer, :offerings, :meeting_id, presence: true

  before_validation :ensure_total_attendees_default_value

  def attendance_date
    super || Date.today
  end

  def ensure_total_attendees_default_value
    self.total_attendees = self.person_attendance_meetings.length if self.total_attendees.blank?
  end

  def offerings
    super || 0
  end
end

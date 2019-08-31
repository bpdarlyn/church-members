class HeaderAttendanceMeeting < ApplicationRecord
  belongs_to :meeting
  has_many :person_attendance_meetings
  validates :topic, :total_attendees, :attendance_date, :prayer, :offerings, :meeting_id, presence: true

  before_create do
    unless self.total_attendees.present?
      self.total_attendees = self.person_attendance_meetings.length
    end
  end

  def attendance_date
    super || Date.today
  end

  def offerings
    super || 0
  end
end

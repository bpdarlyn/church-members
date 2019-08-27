class PersonAttendanceMeeting < ApplicationRecord
  belongs_to :person
  belongs_to :header_attendance_meeting
end

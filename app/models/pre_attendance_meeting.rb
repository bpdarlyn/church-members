class PreAttendanceMeeting < ApplicationRecord
  belongs_to :type_of_meeting
  belongs_to :title_obtained
end

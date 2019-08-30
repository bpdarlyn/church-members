class AddTypeOfMeetingToHeaderAttendanceMeeting < ActiveRecord::Migration[6.0]
  def change
    add_reference :header_attendance_meetings, :meeting, null: false, foreign_key: true
  end
end

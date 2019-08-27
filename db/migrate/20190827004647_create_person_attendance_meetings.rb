class CreatePersonAttendanceMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :person_attendance_meetings do |t|
      t.boolean :attended
      t.references :person, null: false, foreign_key: true
      t.references :header_attendance_meeting, null: false, foreign_key: true,index: { name: "meeting_attend" }
      t.timestamps
    end
  end
end

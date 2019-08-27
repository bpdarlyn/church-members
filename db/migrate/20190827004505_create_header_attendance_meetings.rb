class CreateHeaderAttendanceMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :header_attendance_meetings do |t|
      t.string :topic
      t.date :attendance_date
      t.float :offerings
      t.integer :created_by_id
      t.string :prayer
      t.integer :validated
      t.integer :total_attendees

      t.timestamps
    end
  end
end

class CreatePreAttendanceMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :pre_attendance_meetings do |t|
      t.references :type_of_meeting, null: false, foreign_key: true
      t.references :title_obtained, null: false, foreign_key: true

      t.timestamps
    end
  end
end

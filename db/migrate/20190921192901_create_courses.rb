class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.date :start_date
      t.date :end_date
      t.integer :total_attendes, default: 0
      t.integer :total_people_inscription, default: 0
      t.date :pre_enrollment
      t.date :end_enrollment
      t.integer :min_people, default: 0
      t.integer :max_people, default: 0
      t.float :amount_by_person, default: 0
      t.boolean :attendance_control, default: false
      t.float :total_incoming, default: 0

      t.timestamps
    end
  end
end

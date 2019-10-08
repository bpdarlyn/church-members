class CreateCourseProgresses < ActiveRecord::Migration[6.0]
  def change
    create_table :course_progresses do |t|
      t.references :person, null: false, foreign_key: true
      t.references :type_of_course, null: false, foreign_key: true
      t.boolean :last_course, default: true
      t.date :course_date
      t.timestamps
    end
  end
end

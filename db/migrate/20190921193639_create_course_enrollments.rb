class CreateCourseEnrollments < ActiveRecord::Migration[6.0]
  def change
    create_table :course_enrollments do |t|
      t.references :person, null: false, foreign_key: true
      t.boolean :already_paid
      t.float :partial_payment
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

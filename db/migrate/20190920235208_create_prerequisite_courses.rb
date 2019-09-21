class CreatePrerequisiteCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :prerequisite_courses do |t|
      t.references :type_of_course, null: false, foreign_key: true
      t.references :dependency_type_of_course,null:false, foreign_key: {to_table: :type_of_courses}
      t.timestamps
    end
  end
end

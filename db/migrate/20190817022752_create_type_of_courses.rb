class CreateTypeOfCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :type_of_courses do |t|
      t.string :name
      t.string :description
      t.integer :code

      t.timestamps
    end
  end
end

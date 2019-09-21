class AddReferenceToCourse < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :type_of_course, null: false, foreign_key: true
  end
end

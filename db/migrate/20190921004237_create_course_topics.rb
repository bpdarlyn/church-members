class CreateCourseTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :course_topics do |t|
      t.string :topic_name
      t.references :type_of_course, null: false, foreign_key: true

      t.timestamps
    end
  end
end

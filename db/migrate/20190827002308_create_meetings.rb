class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.date :first_start_date
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.boolean :active
      t.references :type_of_meeting, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.string :code
      t.string :description
      t.string :name
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end

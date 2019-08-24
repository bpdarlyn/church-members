class CreateMyTitles < ActiveRecord::Migration[6.0]
  def change
    create_table :my_titles do |t|
      t.boolean :active
      t.date :title_date
      t.references :title_obtained, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateTitleObtaineds < ActiveRecord::Migration[6.0]
  def change
    create_table :title_obtaineds do |t|
      t.string :title_type
      t.string :name
      t.integer :code

      t.timestamps
    end
  end
end

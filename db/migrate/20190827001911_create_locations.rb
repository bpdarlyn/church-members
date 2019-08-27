class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.string :place_id
      t.string :custom_address
      t.integer :locable_id
      t.string :locable_type

      t.timestamps
    end
  end
end

class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :last_name
      t.string :ci
      t.string :phone_number
      t.string :address
      t.date :birthday

      t.timestamps
    end
  end
end

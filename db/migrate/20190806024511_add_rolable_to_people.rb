class AddRolableToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :rolable_type, :string
    add_column :people, :rolable_id, :integer
  end
end

class CreateChurchMen < ActiveRecord::Migration[6.0]
  def change
    create_table :church_men do |t|
      t.string :token

      t.timestamps
    end
  end
end

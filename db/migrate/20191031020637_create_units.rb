class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.string :unit_type
      t.integer :points

      t.timestamps
    end
  end
end

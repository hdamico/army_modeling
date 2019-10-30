class CreateUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :units do |t|
      t.integer :points
      t.integer :type_id
      t.string  :type_name

      t.timestamps
    end
  end
end

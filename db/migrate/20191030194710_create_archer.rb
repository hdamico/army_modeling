class CreateArcher < ActiveRecord::Migration[5.2]
  def change
    create_table :archers do |t|
      t.integer :points, default: 8

      t.timestamps
    end
  end
end

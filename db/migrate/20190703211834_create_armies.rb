class CreateArmies < ActiveRecord::Migration[5.2]
  def change
    create_table :armies do |t|
      t.integer :coins, default: 1000

      t.timestamps
    end
  end
end

class CreateKnight < ActiveRecord::Migration[5.2]
  def change
    create_table :knights do |t|
      t.integer :points, default: 10

      t.timestamps
    end
  end
end

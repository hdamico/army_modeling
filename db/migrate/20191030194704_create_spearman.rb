class CreateSpearman < ActiveRecord::Migration[5.2]
  def change
    create_table :spearmen do |t|
      t.integer :points, default: 5

      t.timestamps
    end
  end
end

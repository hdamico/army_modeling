class AddArmyForeignKeyToUnits < ActiveRecord::Migration[5.2]
  def change
    add_reference :units, :army, foreign_key: true
    add_reference :units, :type, foreign_key: true
  end
end

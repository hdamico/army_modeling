class AddCivilizationForeignKeyToArmy < ActiveRecord::Migration[5.2]
  def change
    add_reference :armies, :civilization, foreign_key: true
  end
end

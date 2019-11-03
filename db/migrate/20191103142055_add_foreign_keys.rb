class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :units, :army, foreign_key: true
    add_reference :armies, :civilization, foreign_key: true
  end
end

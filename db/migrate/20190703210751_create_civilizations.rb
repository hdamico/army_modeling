class CreateCivilizations < ActiveRecord::Migration[5.2]
  def change
    create_table :civilizations do |t|
      t.string :name, null: false
      t.text :default_units, array: true, default: []

      t.timestamps
    end
  end
end

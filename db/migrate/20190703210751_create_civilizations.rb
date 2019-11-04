class CreateCivilizations < ActiveRecord::Migration[5.2]
  def change
    enable_extension :hstore

    create_table :civilizations do |t|
      t.string :name, null: false
      t.hstore :default_units, default: {}

      t.timestamps
    end
  end
end

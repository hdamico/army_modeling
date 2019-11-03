# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Civilizations
Civilizations::Chinese.create(name: 'Chinese')
Civilizations::English.create(name: 'English')
Civilizations::Byzantine.create(name: 'Byzantine')

# Armies
Army.create(civilization: Civilization.find(1))
Army.create(civilization: Civilization.find(2))
Army.create(civilization: Civilization.find(3))

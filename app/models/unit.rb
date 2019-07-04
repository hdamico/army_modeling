class Unit < ApplicationRecord
  belongs_to :army
  belongs_to :type

  def upgrade
    coins = army.coins if army.coins >= 0
    begin
      case type.id
      when 1
        if coins >= 30
          army.update(coins: coins - 30)
          update(type_id: 2)
        else
          puts("You don't have enough coins!")
        end
      when 2
        if coins >= 40
          army.update(coins: coins - 40)
          update(type_id: 3)
        else
          puts("You don't have enough coins!")
        end
      when 3
        puts("Can't be upgrade!")
      end
    rescue StandardError
      puts("You don't have enough coins!")
    end
  end

  def train
    coins = army.coins if army.coins >= 0
    begin
      case type.id
      when 1
        if coins >= 10
          army.update(coins: coins - 10)
          update(points: points + 3)
        else
          puts("You don't have enough coins!")
        end
      when 2
        if coins >= 20
          army.update(coins: coins - 20)
          update(points: points + 7)
        else
          puts("You don't have enough coins!")
        end
      when 3
        if coins >= 30
          army.update(coins: coins - 30)
          update(points: points + 10)
        else
          puts("You don't have enough coins!")
        end
      end
    rescue StandardError
      puts("You don't have enough coins!")
    end
  end

  def self.generate_default_units(army, units_array)
    type = 1
    points = 5
    values = []
    units_array.each do |unit|
      unit.times do
        values << { army_id: army.id, type_id: type, points: points }
      end
      Unit.import values
      type += 1
      points *= 2
    end
  end
end

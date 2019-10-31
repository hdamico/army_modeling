class Unit < ApplicationRecord
  belongs_to :army
  validate :unit_type

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

  def self.generate_default(units)
    units.each do |k, v|
      v.to_i.times { Unit.create(unit_type: k, points: TYPES.fetch(k.to_sym)) }
    end
  end

  private

  TYPES = { archer: 8, spearman: 5, knight: 10 }.freeze

  def unit_type
    unless TYPES.include?(unit_type.downcase.to_sym)
      errors[:base] << 'Invalid type. Choose between Archer, Spearman or Knight'
    end
  end
end

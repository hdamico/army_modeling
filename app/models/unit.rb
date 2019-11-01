class Unit < ApplicationRecord
  belongs_to :army
  validate :unit_type
  before_create :set_type

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

  private

  TYPES = %w[Units::Archer Units::Spearman Units::Knight].freeze

  def generate_default(civilization)
    case civilization.upcase
    when 'CHINESE'
      generate_units(25, 2, 2)
    when 'BYZANTINE'
      generate_units(10, 10, 10)
    when 'ENGLISH'
      generate_units(5, 8, 15)
    end
  end

  def generate_units(archers, spearmen, knights)
    spearmen.times { Units::Spearman.create(points: 5) }
    archers.times  { Units::Archer.create(points: 8)   }
    knights.times  { Units::Knight.create(points: 10)  }
  end

  def unit_type
    unless TYPES.include?(self.class.to_s)
      errors[:base] << 'Invalid type. Choose between Archer, Spearman or Knight'
    end
  end

  def set_type
    self.unit_type = self.class.name
  end
end

class Unit < ApplicationRecord
  belongs_to :army

  UNIT_TYPES = %w[Units::Archer Units::Spearman Units::Knight].freeze

  def self.generate_default_units(units)
    units.each_with_index do |u, idx|
      u.to_i.times { UNIT_TYPES[idx].constantize.create }
    end
  end

  # def upgrade
  #   coins = army.coins if army.coins >= 0
  #   begin
  #     case type.id
  #     when 1
  #       if coins >= 30
  #         army.update(coins: coins - 30)
  #         update(type_id: 2)
  #       else
  #         puts("You don't have enough coins!")
  #       end
  #     when 2
  #       if coins >= 40
  #         army.update(coins: coins - 40)
  #         update(type_id: 3)
  #       else
  #         puts("You don't have enough coins!")
  #       end
  #     when 3
  #       puts("Can't be upgrade!")
  #     end
  #   rescue StandardError
  #     puts("You don't have enough coins!")
  #   end
  # end

  # def train
  #   coins = army.coins if army.coins >= 0
  #   begin
  #     case type.id
  #     when 1
  #       if coins >= 10
  #         army.update(coins: coins - 10)
  #         update(points: points + 3)
  #       else
  #         puts("You don't have enough coins!")
  #       end
  #     when 2
  #       if coins >= 20
  #         army.update(coins: coins - 20)
  #         update(points: points + 7)
  #       else
  #         puts("You don't have enough coins!")
  #       end
  #     when 3
  #       if coins >= 30
  #         army.update(coins: coins - 30)
  #         update(points: points + 10)
  #       else
  #         puts("You don't have enough coins!")
  #       end
  #     end
  #   rescue StandardError
  #     puts("You don't have enough coins!")
  #   end
  # end
end

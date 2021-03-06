class Army < ApplicationRecord
  belongs_to :civilization
  has_many :units
  after_create :generate_army

  # def to_battle!(enemy)
  #   ally_points = 0
  #   enemy_points = 0
  #   units.each do |unit|
  #     ally_points += unit.points
  #   end
  #   enemy.units.each do |unit|
  #     enemy_points += unit.points
  #   end
  #   winner = who_is_the_winner?(ally_points, enemy_points)
  #   decide_the_punishment(winner, enemy)
  #   if winner != 'Tie'
  #     puts "The winner was #{winner} and won 100 coins!"
  #   else
  #     puts 'There was a TIE! A random unit dies for each team!'
  #   end
  # end

  private

  def generate_army
    units.generate(civilization.default_units)
  end

  # def who_is_the_winner?(ally, enemy)
  #   if ally > enemy
  #     'Ally'
  #   elsif ally < enemy
  #     'Enemy'
  #   else
  #     'Tie'
  #   end
  # end

  # def decide_the_punishment(winner, enemy)
  #   case winner
  #   when 'Enemy'
  #     units.order('points DESC').limit(2).each do |unit|
  #       unit.destroy
  #     end
  #     enemy.update(coins: enemy.coins + 100)
  #   when 'Ally'
  #     enemy.units.order('points DESC').limit(2).each do |unit|
  #       unit.destroy
  #     end
  #     update(coins: coins + 100)
  #   when 'Tie'
  #     units.order('RANDOM()').first.destoy
  #     enemy.units.order('RANDOM()').first.destoy
  #   end
  # end
end

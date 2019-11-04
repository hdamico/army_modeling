module Civilizations
  class Chinese < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = { 'Archer': 25, 'Spearman': 2, 'Knight': 2 }
    end
  end
end

module Civilizations
  class Byzantine < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = { 'Archer': 10, 'Spearman': 10, 'Knight': 10}
    end
  end
end

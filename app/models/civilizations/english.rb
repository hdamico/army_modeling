module Civilizations
  class English < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = { 'Archer': 5, 'Spearman': 8, 'Knight': 15}
    end
  end
end

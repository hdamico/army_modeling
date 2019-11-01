module Civilizations
  class Byzantine < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = [10, 10, 10]
    end
  end
end

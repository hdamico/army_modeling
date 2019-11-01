module Civilizations
  class English < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = [5, 8, 15]
    end
  end
end

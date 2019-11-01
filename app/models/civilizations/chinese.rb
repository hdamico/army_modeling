module Civilizations
  class Chinese < Civilization
    before_create :set_civilization

    private

    def set_civilization
      self.default_units = [25, 2, 2]
    end
  end
end

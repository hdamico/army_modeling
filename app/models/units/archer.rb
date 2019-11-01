module Units
  class Archer < Unit
    before_create :set_archer

    private

    def set_archer
      self.points = 8
      self.unit_type = self.class.name
    end
  end
end

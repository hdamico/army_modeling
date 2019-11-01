module Units
  class Knight < Unit
    before_create :set_knight

    private

    def set_knight
      self.points = 10
      self.unit_type = self.class.name
    end
  end
end

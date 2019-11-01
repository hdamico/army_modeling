module Units
  class Spearman < Unit
    before_create :set_spearman

    private

    def set_spearman
      self.points = 5
      self.unit_type = self.class.name
    end
  end
end

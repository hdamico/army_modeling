class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
  validate :valid_name
  validates_uniqueness_of :name, case_sensitive: false
  before_create :set_default_units
  before_update :no_editable

  CIVILIZATIONS = %w[CHINESE BYZANTINE ENGLISH].freeze

  private

  def valid_name
    errors[:base] << 'Invalid name. Choose between Chinese, Byzantine or English' unless CIVILIZATIONS.include?(name.upcase)
  end

  def set_default_units
    case name.upcase
    when 'CHINESE'
      self.default_units = { spearman: 2, archer: 25, knight: 2 }
    when 'BYZANTINE'
      self.default_units = { spearman: 10, archer: 10, knight: 10 }
    when 'ENGLISH'
      self.default_units = { spearman: 5, archer: 8, knight: 15 }
    end
  end

  def no_editable
    raise "Can't be update"
  end
end

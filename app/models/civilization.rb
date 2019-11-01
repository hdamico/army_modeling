class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
  validate :valid_name
  validates_uniqueness_of :name, case_sensitive: false
  before_create :set_default_units
  before_update :no_editable

  CIVILIZATIONS = %w[CHINESE BYZANTINE ENGLISH].freeze

  private

  def valid_name
    unless CIVILIZATIONS.include?(name.upcase)
      errors[:base] << 'Invalid name. Choose between Chinese, Byzantine or English'
    end
  end

  def set_default_units
    Unit.generate_default(civilization.name)
  end

  def no_editable
    raise "Can't be update"
  end
end

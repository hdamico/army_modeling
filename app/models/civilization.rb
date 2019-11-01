class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
  validates_uniqueness_of :name, case_sensitive: false
  validate :valid_name
  before_update :no_editable

  private

  CIVILIZATIONS = %w[CHINESE BYZANTINE ENGLISH].freeze

  def valid_name
    unless CIVILIZATIONS.include?(name.upcase)
      errors[:base] << 'Invalid name. Choose between Chinese, Byzantine or English'
    end
  end

  def no_editable
    raise "Can't be update"
  end
end

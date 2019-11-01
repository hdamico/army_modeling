class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
  validates_uniqueness_of :name, case_sensitive: false
  validate :valid_name

  private

  CIVILIZATIONS = %w[CHINESE BYZANTINE ENGLISH].freeze

  def valid_name
    unless CIVILIZATIONS.include?(name.upcase)
      errors[:base] << 'Invalid name. Choose between Chinese, Byzantine or English'
    end
  end
end

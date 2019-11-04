class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
  validates_uniqueness_of :name, case_sensitive: false
  before_update -> { raise "Can't be update" }
end

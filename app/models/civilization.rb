class Civilization < ApplicationRecord
  has_many :armies, dependent: :destroy
end

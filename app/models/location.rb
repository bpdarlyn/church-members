class Location < ApplicationRecord
  validates :custom_address,presence: true
end

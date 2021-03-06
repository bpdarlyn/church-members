class Admin < ApplicationRecord
  has_one :person, as: :rolable, dependent: :destroy
  accepts_nested_attributes_for :person, allow_destroy: true
  validates_associated :person
end

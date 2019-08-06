class Admin < ApplicationRecord
  has_one :person, as: :rolable, dependent: :destroy
end

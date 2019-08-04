class Person < ApplicationRecord
  has_one :user, dependent: :destroy

  def is?(role)
    role == self.rolable.class.name.downcase.to_sym
  end
end

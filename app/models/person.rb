class Person < ApplicationRecord
  #Relationships
  belongs_to :rolable, polymorphic: true

  has_one :user, dependent: :destroy

  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true

  def is?(role)
    role == self.rolable.class.name.downcase.to_sym
  end

  def full_name
    "#{name.titleize} #{last_name.titleize}"
  end
end

class Person < ApplicationRecord
  #Relationships
  belongs_to :rolable, polymorphic: true, optional: true

  has_one :user, dependent: :destroy

  has_many :my_titles, dependent: :destroy
  has_many :title_obtaineds, through: :my_titles
  has_one :active_my_title, -> {where(active: true)} , class_name: 'MyTitle', foreign_key: 'person_id'
  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :my_titles, reject_if: :all_blank, allow_destroy: true
  validates :name,:last_name, presence: true


  def is?(role)
    role == self.rolable.class.name.downcase.to_sym
  end

  def full_name
    "#{name.titleize} #{last_name.titleize}"
  end

  def age
    (Date.today.year - self.birthday.year) if self.birthday.presence
  end

  def birthday
    super || Date.today - 18.years
  end
end

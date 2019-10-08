class Person < ApplicationRecord
  #Relationships
  belongs_to :rolable, polymorphic: true, optional: true
  belongs_to :person_leader, class_name: 'Person', foreign_key: 'person_id', optional: true
  has_many :disciples, class_name: 'Person'
  has_one :user, dependent: :destroy
  has_many :my_titles, dependent: :destroy
  has_many :meetings, dependent: :destroy
  has_many :type_of_meetings, through: :meetings
  has_many :title_obtaineds, through: :my_titles
  has_one :active_my_title, -> {where(active: true)}, class_name: 'MyTitle', foreign_key: 'person_id'

  # Decorators
  accepts_nested_attributes_for :user, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :my_titles, reject_if: :all_blank, allow_destroy: true

  # Validations
  validates :name, :last_name, :sex, presence: true
  validate :check_at_least_one_title

  # Scopes
  scope :possible_attendances_to_meeting?, ->(meeting, leader) {
    type_of_meeting = meeting.type_of_meeting
    prerrequisities = type_of_meeting.pre_attendance_meetings.pluck(:title_obtained_id)
    leader ||= meeting.person
    leader.disciples.joins(:active_my_title).where(my_titles: {title_obtained_id: prerrequisities})
  }
  scope :possible_attendances_to_course?, ->(course, leader) {
    type_of_course = course.type_of_course
    # prerrequisities = type_of_meeting.pre_attendance_meetings.pluck(:title_obtained_id)
    # leader ||= meeting.person
    # leader.disciples.joins(:active_my_title).where(my_titles: {title_obtained_id: prerrequisities})
  }


  def check_at_least_one_title
    unless self.rolable
      unless self.my_titles.find {|mt| mt.active === true}
        errors.add(:active_my_title, 'Selecciona al menos un rol de la persona')
      end
    end
  end


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

  def self.type_of_sex
    %w(M F)
  end
end

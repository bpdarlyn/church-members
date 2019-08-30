class Meeting < ApplicationRecord
  # Relationships
  belongs_to :type_of_meeting
  belongs_to :person
  belongs_to :location

  # Validations
  validates :name, :start_date_time, :end_date_time, :type_of_meeting, :person, :location, presence: true

  validates :person_id,:type_of_meeting_id,:code, uniqueness: { scope: [:person_id,:type_of_meeting_id,:code]}

  accepts_nested_attributes_for :location, reject_if: :all_blank, allow_destroy: true

  # Callbacks
  before_create do
    first_start_date = Date.today
  end

  def full_description
    "#{self.name}- #{self.code}"
  end



end

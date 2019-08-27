class TypeOfMeeting < ApplicationRecord
  has_many :pre_attendance_meetings,dependent: :destroy, validate: true
  has_many :title_obtaineds,through: :pre_attendance_meetings
  has_many :meetings, dependent: :destroy
  accepts_nested_attributes_for :pre_attendance_meetings, allow_destroy: true, update_only: true
end

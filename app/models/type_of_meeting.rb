class TypeOfMeeting < ApplicationRecord
  has_many :pre_attendance_meetings,dependent: :destroy, validate: true
  has_many :title_obtaineds,through: :pre_attendance_meetings
  accepts_nested_attributes_for :pre_attendance_meetings, allow_destroy: true, update_only: true

  # Callbacks
  before_update :destroy_pre_attendance

  def destroy_pre_attendance
    pre_attendance_meetings.destroy_all
  end
end
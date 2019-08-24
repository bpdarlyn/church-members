class TitleObtained < ApplicationRecord
  has_many :pre_attendance_meetings,dependent: :destroy
end

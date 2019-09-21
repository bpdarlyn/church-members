class Course < ApplicationRecord
  belongs_to :type_of_course
  has_many :course_enrollments, dependent: :destroy
  accepts_nested_attributes_for :course_enrollments, reject_if: :all_blank, allow_destroy: true

  validates :start_date,:end_date,
            :name,
            :type_of_course_id,
            :pre_enrollment,:end_enrollment,:min_people,
            :max_people, :amount_by_person,:attendance_control, presence:true

end

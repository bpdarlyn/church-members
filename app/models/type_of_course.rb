class TypeOfCourse < ApplicationRecord
  has_many :prerequisites, class_name: 'PrerequisiteCourse',dependent: :destroy
  has_many :prerequisite_type_of_courses, through: :prerequisites, source: :prerequisite_course
  has_many :course_topics, dependent: :destroy
  accepts_nested_attributes_for :prerequisites, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :course_topics, reject_if: :all_blank, allow_destroy: true
end

class PrerequisiteCourse < ApplicationRecord
  belongs_to :type_of_course
  belongs_to :prerequisite_course, class_name: "TypeOfCourse",foreign_key: 'dependency_type_of_course_id'
  validates_uniqueness_of :prerequisite_course, scope: :type_of_course
end

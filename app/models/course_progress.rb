class CourseProgress < ApplicationRecord
  belongs_to :person
  belongs_to :type_of_course
end

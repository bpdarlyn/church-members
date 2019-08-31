json.attendance_people @attendance_people do |attendance_person|
  json.person_id attendance_person.id
  json.full_name attendance_person.full_name
  json.role_type attendance_person.active_my_title.try(:title_obtained).try(:name)
  json.attendance false
  json.birthday attendance_person.birthday
  json.phone_number attendance_person.phone_number
end
json.attendance_control @meeting.attendance_control
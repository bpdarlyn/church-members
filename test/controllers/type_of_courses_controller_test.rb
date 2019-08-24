require 'test_helper'

class TypeOfCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_course = type_of_courses(:one)
  end

  test "should get index" do
    get type_of_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_course_url
    assert_response :success
  end

  test "should create type_of_course" do
    assert_difference('TypeOfCourse.count') do
      post type_of_courses_url, params: { type_of_course: { code: @type_of_course.code, description: @type_of_course.description, name: @type_of_course.name } }
    end

    assert_redirected_to type_of_course_url(TypeOfCourse.last)
  end

  test "should show type_of_course" do
    get type_of_course_url(@type_of_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_course_url(@type_of_course)
    assert_response :success
  end

  test "should update type_of_course" do
    patch type_of_course_url(@type_of_course), params: { type_of_course: { code: @type_of_course.code, description: @type_of_course.description, name: @type_of_course.name } }
    assert_redirected_to type_of_course_url(@type_of_course)
  end

  test "should destroy type_of_course" do
    assert_difference('TypeOfCourse.count', -1) do
      delete type_of_course_url(@type_of_course)
    end

    assert_redirected_to type_of_courses_url
  end
end

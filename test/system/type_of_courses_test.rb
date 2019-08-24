require "application_system_test_case"

class TypeOfCoursesTest < ApplicationSystemTestCase
  setup do
    @type_of_course = type_of_courses(:one)
  end

  test "visiting the index" do
    visit type_of_courses_url
    assert_selector "h1", text: "Type Of Courses"
  end

  test "creating a Type of course" do
    visit type_of_courses_url
    click_on "New Type Of Course"

    fill_in "Code", with: @type_of_course.code
    fill_in "Description", with: @type_of_course.description
    fill_in "Name", with: @type_of_course.name
    click_on "Create Type of course"

    assert_text "Type of course was successfully created"
    click_on "Back"
  end

  test "updating a Type of course" do
    visit type_of_courses_url
    click_on "Edit", match: :first

    fill_in "Code", with: @type_of_course.code
    fill_in "Description", with: @type_of_course.description
    fill_in "Name", with: @type_of_course.name
    click_on "Update Type of course"

    assert_text "Type of course was successfully updated"
    click_on "Back"
  end

  test "destroying a Type of course" do
    visit type_of_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type of course was successfully destroyed"
  end
end

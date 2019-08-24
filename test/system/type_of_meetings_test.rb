require "application_system_test_case"

class TypeOfMeetingsTest < ApplicationSystemTestCase
  setup do
    @type_of_meeting = type_of_meetings(:one)
  end

  test "visiting the index" do
    visit type_of_meetings_url
    assert_selector "h1", text: "Type Of Meetings"
  end

  test "creating a Type of meeting" do
    visit type_of_meetings_url
    click_on "New Type Of Meeting"

    fill_in "Code", with: @type_of_meeting.code
    fill_in "Description", with: @type_of_meeting.description
    fill_in "Name", with: @type_of_meeting.name
    click_on "Create Type of meeting"

    assert_text "Type of meeting was successfully created"
    click_on "Back"
  end

  test "updating a Type of meeting" do
    visit type_of_meetings_url
    click_on "Edit", match: :first

    fill_in "Code", with: @type_of_meeting.code
    fill_in "Description", with: @type_of_meeting.description
    fill_in "Name", with: @type_of_meeting.name
    click_on "Update Type of meeting"

    assert_text "Type of meeting was successfully updated"
    click_on "Back"
  end

  test "destroying a Type of meeting" do
    visit type_of_meetings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Type of meeting was successfully destroyed"
  end
end

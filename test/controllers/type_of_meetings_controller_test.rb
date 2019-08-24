require 'test_helper'

class TypeOfMeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_of_meeting = type_of_meetings(:one)
  end

  test "should get index" do
    get type_of_meetings_url
    assert_response :success
  end

  test "should get new" do
    get new_type_of_meeting_url
    assert_response :success
  end

  test "should create type_of_meeting" do
    assert_difference('TypeOfMeeting.count') do
      post type_of_meetings_url, params: { type_of_meeting: { code: @type_of_meeting.code, description: @type_of_meeting.description, name: @type_of_meeting.name } }
    end

    assert_redirected_to type_of_meeting_url(TypeOfMeeting.last)
  end

  test "should show type_of_meeting" do
    get type_of_meeting_url(@type_of_meeting)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_of_meeting_url(@type_of_meeting)
    assert_response :success
  end

  test "should update type_of_meeting" do
    patch type_of_meeting_url(@type_of_meeting), params: { type_of_meeting: { code: @type_of_meeting.code, description: @type_of_meeting.description, name: @type_of_meeting.name } }
    assert_redirected_to type_of_meeting_url(@type_of_meeting)
  end

  test "should destroy type_of_meeting" do
    assert_difference('TypeOfMeeting.count', -1) do
      delete type_of_meeting_url(@type_of_meeting)
    end

    assert_redirected_to type_of_meetings_url
  end
end

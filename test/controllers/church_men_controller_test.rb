require 'test_helper'

class ChurchMenControllerTest < ActionDispatch::IntegrationTest
  setup do
    @church_man = church_men(:one)
  end

  test "should get index" do
    get church_men_url
    assert_response :success
  end

  test "should get new" do
    get new_church_man_url
    assert_response :success
  end

  test "should create church_man" do
    assert_difference('ChurchMan.count') do
      post church_men_url, params: { church_man: { token: @church_man.token } }
    end

    assert_redirected_to church_man_url(ChurchMan.last)
  end

  test "should show church_man" do
    get church_man_url(@church_man)
    assert_response :success
  end

  test "should get edit" do
    get edit_church_man_url(@church_man)
    assert_response :success
  end

  test "should update church_man" do
    patch church_man_url(@church_man), params: { church_man: { token: @church_man.token } }
    assert_redirected_to church_man_url(@church_man)
  end

  test "should destroy church_man" do
    assert_difference('ChurchMan.count', -1) do
      delete church_man_url(@church_man)
    end

    assert_redirected_to church_men_url
  end
end

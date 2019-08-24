require 'test_helper'

class TitleObtainedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @title_obtained = title_obtaineds(:one)
  end

  test "should get index" do
    get title_obtaineds_url
    assert_response :success
  end

  test "should get new" do
    get new_title_obtained_url
    assert_response :success
  end

  test "should create title_obtained" do
    assert_difference('TitleObtained.count') do
      post title_obtaineds_url, params: { title_obtained: { name: @title_obtained.name, title_type: @title_obtained.title_type } }
    end

    assert_redirected_to title_obtained_url(TitleObtained.last)
  end

  test "should show title_obtained" do
    get title_obtained_url(@title_obtained)
    assert_response :success
  end

  test "should get edit" do
    get edit_title_obtained_url(@title_obtained)
    assert_response :success
  end

  test "should update title_obtained" do
    patch title_obtained_url(@title_obtained), params: { title_obtained: { name: @title_obtained.name, title_type: @title_obtained.title_type } }
    assert_redirected_to title_obtained_url(@title_obtained)
  end

  test "should destroy title_obtained" do
    assert_difference('TitleObtained.count', -1) do
      delete title_obtained_url(@title_obtained)
    end

    assert_redirected_to title_obtaineds_url
  end
end

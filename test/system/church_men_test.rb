require "application_system_test_case"

class ChurchMenTest < ApplicationSystemTestCase
  setup do
    @church_man = church_men(:one)
  end

  test "visiting the index" do
    visit church_men_url
    assert_selector "h1", text: "Church Men"
  end

  test "creating a Church man" do
    visit church_men_url
    click_on "New Church Man"

    fill_in "Token", with: @church_man.token
    click_on "Create Church man"

    assert_text "Church man was successfully created"
    click_on "Back"
  end

  test "updating a Church man" do
    visit church_men_url
    click_on "Edit", match: :first

    fill_in "Token", with: @church_man.token
    click_on "Update Church man"

    assert_text "Church man was successfully updated"
    click_on "Back"
  end

  test "destroying a Church man" do
    visit church_men_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Church man was successfully destroyed"
  end
end

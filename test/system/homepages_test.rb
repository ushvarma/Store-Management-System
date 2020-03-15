require "application_system_test_case"

class HomepagesTest < ApplicationSystemTestCase
  setup do
    @homepage = homepages(:one)
  end

  test "visiting the index" do
    visit homepages_url
    assert_selector "h1", text: "Homepages"
  end

  test "creating a Homepage" do
    visit homepages_url
    click_on "New Homepage"

    fill_in "Name", with: @homepage.name
    click_on "Create Homepage"

    assert_text "Homepage was successfully created"
    click_on "Back"
  end

  test "updating a Homepage" do
    visit homepages_url
    click_on "Edit", match: :first

    fill_in "Name", with: @homepage.name
    click_on "Update Homepage"

    assert_text "Homepage was successfully updated"
    click_on "Back"
  end

  test "destroying a Homepage" do
    visit homepages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Homepage was successfully destroyed"
  end
end

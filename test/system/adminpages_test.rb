require "application_system_test_case"

class AdminpagesTest < ApplicationSystemTestCase
  setup do
    @adminpage = adminpages(:one)
  end

  test "visiting the index" do
    visit adminpages_url
    assert_selector "h1", text: "Adminpages"
  end

  test "creating a Adminpage" do
    visit adminpages_url
    click_on "New Adminpage"

    fill_in "Cvv", with: @adminpage.CVV
    fill_in "Address", with: @adminpage.address
    fill_in "Credit card number", with: @adminpage.credit_card_number
    fill_in "Date of birth", with: @adminpage.date_of_birth
    fill_in "Email", with: @adminpage.email
    fill_in "Expiration date", with: @adminpage.expiration_date
    fill_in "Name", with: @adminpage.name
    fill_in "Name on card", with: @adminpage.name_on_card
    fill_in "Password", with: @adminpage.password
    fill_in "Phone number", with: @adminpage.phone_number
    click_on "Create Adminpage"

    assert_text "Adminpage was successfully created"
    click_on "Back"
  end

  test "updating a Adminpage" do
    visit adminpages_url
    click_on "Edit", match: :first

    fill_in "Cvv", with: @adminpage.CVV
    fill_in "Address", with: @adminpage.address
    fill_in "Credit card number", with: @adminpage.credit_card_number
    fill_in "Date of birth", with: @adminpage.date_of_birth
    fill_in "Email", with: @adminpage.email
    fill_in "Expiration date", with: @adminpage.expiration_date
    fill_in "Name", with: @adminpage.name
    fill_in "Name on card", with: @adminpage.name_on_card
    fill_in "Password", with: @adminpage.password
    fill_in "Phone number", with: @adminpage.phone_number
    click_on "Update Adminpage"

    assert_text "Adminpage was successfully updated"
    click_on "Back"
  end

  test "destroying a Adminpage" do
    visit adminpages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adminpage was successfully destroyed"
  end
end

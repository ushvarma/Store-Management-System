require "application_system_test_case"

class SpecialItemsTest < ApplicationSystemTestCase
  setup do
    @special_item = special_items(:one)
  end

  test "visiting the index" do
    visit special_items_url
    assert_selector "h1", text: "Special Items"
  end

  test "creating a Special item" do
    visit special_items_url
    click_on "New Special Item"

    fill_in "Refundamount", with: @special_item.refundAmount
    check "Specialitemstatus" if @special_item.specialItemStatus
    fill_in "Specialitemtransactionid", with: @special_item.specialItemTransactionId
    fill_in "Specialitemid", with: @special_item.specialItemid
    fill_in "Specialquantity", with: @special_item.specialQuantity
    fill_in "Specialuserid", with: @special_item.specialUserId
    click_on "Create Special item"

    assert_text "Special item was successfully created"
    click_on "Back"
  end

  test "updating a Special item" do
    visit special_items_url
    click_on "Edit", match: :first

    fill_in "Refundamount", with: @special_item.refundAmount
    check "Specialitemstatus" if @special_item.specialItemStatus
    fill_in "Specialitemtransactionid", with: @special_item.specialItemTransactionId
    fill_in "Specialitemid", with: @special_item.specialItemid
    fill_in "Specialquantity", with: @special_item.specialQuantity
    fill_in "Specialuserid", with: @special_item.specialUserId
    click_on "Update Special item"

    assert_text "Special item was successfully updated"
    click_on "Back"
  end

  test "destroying a Special item" do
    visit special_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Special item was successfully destroyed"
  end
end

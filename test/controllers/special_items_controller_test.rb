require 'test_helper'

class SpecialItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @special_item = special_items(:one)
  end

  test "should get index" do
    get special_items_url
    assert_response :success
  end

  test "should get new" do
    get new_special_item_url
    assert_response :success
  end

  test "should create special_item" do
    assert_difference('SpecialItem.count') do
      post special_items_url, params: { special_item: { refundAmount: @special_item.refundAmount, specialItemStatus: @special_item.specialItemStatus, specialItemTransactionId: @special_item.specialItemTransactionId, specialItemid: @special_item.specialItemid, specialQuantity: @special_item.specialQuantity, specialUserId: @special_item.specialUserId } }
    end

    assert_redirected_to special_item_url(SpecialItem.last)
  end

  test "should show special_item" do
    get special_item_url(@special_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_special_item_url(@special_item)
    assert_response :success
  end

  test "should update special_item" do
    patch special_item_url(@special_item), params: { special_item: { refundAmount: @special_item.refundAmount, specialItemStatus: @special_item.specialItemStatus, specialItemTransactionId: @special_item.specialItemTransactionId, specialItemid: @special_item.specialItemid, specialQuantity: @special_item.specialQuantity, specialUserId: @special_item.specialUserId } }
    assert_redirected_to special_item_url(@special_item)
  end

  test "should destroy special_item" do
    assert_difference('SpecialItem.count', -1) do
      delete special_item_url(@special_item)
    end

    assert_redirected_to special_items_url
  end
end

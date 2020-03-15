require 'test_helper'

class AdminpagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adminpage = adminpages(:one)
  end

  test "should get index" do
    get adminpages_url
    assert_response :success
  end

  test "should get new" do
    get new_adminpage_url
    assert_response :success
  end

  test "should create adminpage" do
    assert_difference('Adminpage.count') do
      post adminpages_url, params: { adminpage: { CVV: @adminpage.CVV, address: @adminpage.address, credit_card_number: @adminpage.credit_card_number, date_of_birth: @adminpage.date_of_birth, email: @adminpage.email, expiration_date: @adminpage.expiration_date, name: @adminpage.name, name_on_card: @adminpage.name_on_card, password: @adminpage.password, phone_number: @adminpage.phone_number } }
    end

    assert_redirected_to adminpage_url(Adminpage.last)
  end

  test "should show adminpage" do
    get adminpage_url(@adminpage)
    assert_response :success
  end

  test "should get edit" do
    get edit_adminpage_url(@adminpage)
    assert_response :success
  end

  test "should update adminpage" do
    patch adminpage_url(@adminpage), params: { adminpage: { CVV: @adminpage.CVV, address: @adminpage.address, credit_card_number: @adminpage.credit_card_number, date_of_birth: @adminpage.date_of_birth, email: @adminpage.email, expiration_date: @adminpage.expiration_date, name: @adminpage.name, name_on_card: @adminpage.name_on_card, password: @adminpage.password, phone_number: @adminpage.phone_number } }
    assert_redirected_to adminpage_url(@adminpage)
  end

  test "should destroy adminpage" do
    assert_difference('Adminpage.count', -1) do
      delete adminpage_url(@adminpage)
    end

    assert_redirected_to adminpages_url
  end
end

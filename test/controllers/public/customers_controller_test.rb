require "test_helper"

class Public::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_customers_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_customers_edit_url
    assert_response :success
  end

  test "should get show" do
    get public_customers_show_url
    assert_response :success
  end

  test "should get follows" do
    get public_customers_follows_url
    assert_response :success
  end

  test "should get followers" do
    get public_customers_followers_url
    assert_response :success
  end
end

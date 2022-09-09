require "test_helper"

class Admin::FreezesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_freezes_index_url
    assert_response :success
  end
end

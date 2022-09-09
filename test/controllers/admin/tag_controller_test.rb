require "test_helper"

class Admin::TagControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_tag_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_tag_edit_url
    assert_response :success
  end
end

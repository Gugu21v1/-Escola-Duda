require "test_helper"

class PermissaosControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get permissaos_edit_url
    assert_response :success
  end

  test "should get update" do
    get permissaos_update_url
    assert_response :success
  end
end

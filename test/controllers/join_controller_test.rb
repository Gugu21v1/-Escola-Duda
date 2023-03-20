require "test_helper"

class JoinControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_new_url
    assert_response :success
  end

  test "should get create" do
    get join_create_url
    assert_response :success
  end
end

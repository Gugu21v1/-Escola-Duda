require "test_helper"

class HorariosControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get horarios_edit_url
    assert_response :success
  end

  test "should get update" do
    get horarios_update_url
    assert_response :success
  end
end

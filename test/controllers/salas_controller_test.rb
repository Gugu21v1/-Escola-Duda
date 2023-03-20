require "test_helper"

class SalasControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get salas_new_url
    assert_response :success
  end

  test "should get create" do
    get salas_create_url
    assert_response :success
  end

  test "should get index" do
    get salas_index_url
    assert_response :success
  end

  test "should get show" do
    get salas_show_url
    assert_response :success
  end
end

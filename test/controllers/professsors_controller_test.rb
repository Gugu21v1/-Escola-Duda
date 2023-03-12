require "test_helper"

class ProfesssorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get professsors_index_url
    assert_response :success
  end

  test "should get show" do
    get professsors_show_url
    assert_response :success
  end

  test "should get new" do
    get professsors_new_url
    assert_response :success
  end

  test "should get create" do
    get professsors_create_url
    assert_response :success
  end

  test "should get destroy" do
    get professsors_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get professsors_edit_url
    assert_response :success
  end

  test "should get update" do
    get professsors_update_url
    assert_response :success
  end
end

require "test_helper"

class JoinMateriasProfsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get join_materias_profs_new_url
    assert_response :success
  end

  test "should get create" do
    get join_materias_profs_create_url
    assert_response :success
  end
end

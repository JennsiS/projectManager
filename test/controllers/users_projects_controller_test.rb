require "test_helper"

class UsersProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_project = users_projects(:one)
  end

  test "should get index" do
    get users_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_users_project_url
    assert_response :success
  end

  test "should create users_project" do
    assert_difference("UsersProject.count") do
      post users_projects_url, params: { users_project: { project_id: @users_project.project_id, rol_project_user: @users_project.rol_project_user, user_id: @users_project.user_id } }
    end

    assert_redirected_to users_project_url(UsersProject.last)
  end

  test "should show users_project" do
    get users_project_url(@users_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_users_project_url(@users_project)
    assert_response :success
  end

  test "should update users_project" do
    patch users_project_url(@users_project), params: { users_project: { project_id: @users_project.project_id, rol_project_user: @users_project.rol_project_user, user_id: @users_project.user_id } }
    assert_redirected_to users_project_url(@users_project)
  end

  test "should destroy users_project" do
    assert_difference("UsersProject.count", -1) do
      delete users_project_url(@users_project)
    end

    assert_redirected_to users_projects_url
  end
end

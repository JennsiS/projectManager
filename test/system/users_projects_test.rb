require "application_system_test_case"

class UsersProjectsTest < ApplicationSystemTestCase
  setup do
    @users_project = users_projects(:one)
  end

  test "visiting the index" do
    visit users_projects_url
    assert_selector "h1", text: "Users projects"
  end

  test "should create users project" do
    visit users_projects_url
    click_on "New users project"

    fill_in "Project", with: @users_project.project_id
    fill_in "Rol project user", with: @users_project.rol_project_user
    fill_in "User", with: @users_project.user_id
    click_on "Create Users project"

    assert_text "Users project was successfully created"
    click_on "Back"
  end

  test "should update Users project" do
    visit users_project_url(@users_project)
    click_on "Edit this users project", match: :first

    fill_in "Project", with: @users_project.project_id
    fill_in "Rol project user", with: @users_project.rol_project_user
    fill_in "User", with: @users_project.user_id
    click_on "Update Users project"

    assert_text "Users project was successfully updated"
    click_on "Back"
  end

  test "should destroy Users project" do
    visit users_project_url(@users_project)
    click_on "Destroy this users project", match: :first

    assert_text "Users project was successfully destroyed"
  end
end

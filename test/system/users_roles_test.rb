require "application_system_test_case"

class UsersRolesTest < ApplicationSystemTestCase
  setup do
    @users_role = users_roles(:one)
  end

  test "visiting the index" do
    visit users_roles_url
    assert_selector "h1", text: "Users roles"
  end

  test "should create users role" do
    visit users_roles_url
    click_on "New users role"

    fill_in "Role", with: @users_role.role_id
    fill_in "User", with: @users_role.user_id
    click_on "Create Users role"

    assert_text "Users role was successfully created"
    click_on "Back"
  end

  test "should update Users role" do
    visit users_role_url(@users_role)
    click_on "Edit this users role", match: :first

    fill_in "Role", with: @users_role.role_id
    fill_in "User", with: @users_role.user_id
    click_on "Update Users role"

    assert_text "Users role was successfully updated"
    click_on "Back"
  end

  test "should destroy Users role" do
    visit users_role_url(@users_role)
    click_on "Destroy this users role", match: :first

    assert_text "Users role was successfully destroyed"
  end
end

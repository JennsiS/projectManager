require "application_system_test_case"

class ProjectsPhasesTest < ApplicationSystemTestCase
  setup do
    @projects_phase = projects_phases(:one)
  end

  test "visiting the index" do
    visit projects_phases_url
    assert_selector "h1", text: "Projects phases"
  end

  test "should create projects phase" do
    visit projects_phases_url
    click_on "New projects phase"

    fill_in "Phase", with: @projects_phase.phase_id
    fill_in "Project", with: @projects_phase.project_id
    fill_in "Role user", with: @projects_phase.role_user
    fill_in "User", with: @projects_phase.user_id
    click_on "Create Projects phase"

    assert_text "Projects phase was successfully created"
    click_on "Back"
  end

  test "should update Projects phase" do
    visit projects_phase_url(@projects_phase)
    click_on "Edit this projects phase", match: :first

    fill_in "Phase", with: @projects_phase.phase_id
    fill_in "Project", with: @projects_phase.project_id
    fill_in "Role user", with: @projects_phase.role_user
    fill_in "User", with: @projects_phase.user_id
    click_on "Update Projects phase"

    assert_text "Projects phase was successfully updated"
    click_on "Back"
  end

  test "should destroy Projects phase" do
    visit projects_phase_url(@projects_phase)
    click_on "Destroy this projects phase", match: :first

    assert_text "Projects phase was successfully destroyed"
  end
end

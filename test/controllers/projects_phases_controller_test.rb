require "test_helper"

class ProjectsPhasesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @projects_phase = projects_phases(:one)
  end

  test "should get index" do
    get projects_phases_url
    assert_response :success
  end

  test "should get new" do
    get new_projects_phase_url
    assert_response :success
  end

  test "should create projects_phase" do
    assert_difference("ProjectsPhase.count") do
      post projects_phases_url, params: { projects_phase: { phase_id: @projects_phase.phase_id, project_id: @projects_phase.project_id, role_user: @projects_phase.role_user, user_id: @projects_phase.user_id } }
    end

    assert_redirected_to projects_phase_url(ProjectsPhase.last)
  end

  test "should show projects_phase" do
    get projects_phase_url(@projects_phase)
    assert_response :success
  end

  test "should get edit" do
    get edit_projects_phase_url(@projects_phase)
    assert_response :success
  end

  test "should update projects_phase" do
    patch projects_phase_url(@projects_phase), params: { projects_phase: { phase_id: @projects_phase.phase_id, project_id: @projects_phase.project_id, role_user: @projects_phase.role_user, user_id: @projects_phase.user_id } }
    assert_redirected_to projects_phase_url(@projects_phase)
  end

  test "should destroy projects_phase" do
    assert_difference("ProjectsPhase.count", -1) do
      delete projects_phase_url(@projects_phase)
    end

    assert_redirected_to projects_phases_url
  end
end

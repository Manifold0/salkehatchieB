require 'test_helper'

class CampAssignmentsControllerTest < ActionController::TestCase
  setup do
    @camp_assignment = camp_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camp_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp_assignment" do
    assert_difference('CampAssignment.count') do
      post :create, camp_assignment: { camp_id: @camp_assignment.camp_id, permission_level: @camp_assignment.permission_level, user_id: @camp_assignment.user_id }
    end

    assert_redirected_to camp_assignment_path(assigns(:camp_assignment))
  end

  test "should show camp_assignment" do
    get :show, id: @camp_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camp_assignment
    assert_response :success
  end

  test "should update camp_assignment" do
    patch :update, id: @camp_assignment, camp_assignment: { camp_id: @camp_assignment.camp_id, permission_level: @camp_assignment.permission_level, user_id: @camp_assignment.user_id }
    assert_redirected_to camp_assignment_path(assigns(:camp_assignment))
  end

  test "should destroy camp_assignment" do
    assert_difference('CampAssignment.count', -1) do
      delete :destroy, id: @camp_assignment
    end

    assert_redirected_to camp_assignments_path
  end
end

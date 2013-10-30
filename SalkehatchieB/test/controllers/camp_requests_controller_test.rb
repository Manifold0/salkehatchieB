require 'test_helper'

class CampRequestsControllerTest < ActionController::TestCase
  setup do
    @camp_request = camp_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camp_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp_request" do
    assert_difference('CampRequest.count') do
      post :create, camp_request: { camp_id: @camp_request.camp_id, preference1: @camp_request.preference1, preference2: @camp_request.preference2, preference3: @camp_request.preference3, status: @camp_request.status, user_id: @camp_request.user_id }
    end

    assert_redirected_to camp_request_path(assigns(:camp_request))
  end

  test "should show camp_request" do
    get :show, id: @camp_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camp_request
    assert_response :success
  end

  test "should update camp_request" do
    patch :update, id: @camp_request, camp_request: { camp_id: @camp_request.camp_id, preference1: @camp_request.preference1, preference2: @camp_request.preference2, preference3: @camp_request.preference3, status: @camp_request.status, user_id: @camp_request.user_id }
    assert_redirected_to camp_request_path(assigns(:camp_request))
  end

  test "should destroy camp_request" do
    assert_difference('CampRequest.count', -1) do
      delete :destroy, id: @camp_request
    end

    assert_redirected_to camp_requests_path
  end
end

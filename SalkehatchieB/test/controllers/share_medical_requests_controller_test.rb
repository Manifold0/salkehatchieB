require 'test_helper'

class ShareMedicalRequestsControllerTest < ActionController::TestCase
  setup do
    @share_medical_request = share_medical_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:share_medical_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create share_medical_request" do
    assert_difference('ShareMedicalRequest.count') do
      post :create, share_medical_request: { references: @share_medical_request.references, references: @share_medical_request.references }
    end

    assert_redirected_to share_medical_request_path(assigns(:share_medical_request))
  end

  test "should show share_medical_request" do
    get :show, id: @share_medical_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @share_medical_request
    assert_response :success
  end

  test "should update share_medical_request" do
    patch :update, id: @share_medical_request, share_medical_request: { references: @share_medical_request.references, references: @share_medical_request.references }
    assert_redirected_to share_medical_request_path(assigns(:share_medical_request))
  end

  test "should destroy share_medical_request" do
    assert_difference('ShareMedicalRequest.count', -1) do
      delete :destroy, id: @share_medical_request
    end

    assert_redirected_to share_medical_requests_path
  end
end

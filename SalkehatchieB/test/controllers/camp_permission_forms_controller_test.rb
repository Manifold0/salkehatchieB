require 'test_helper'

class CampPermissionFormsControllerTest < ActionController::TestCase
  setup do
    @camp_permission_form = camp_permission_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:camp_permission_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create camp_permission_form" do
    assert_difference('CampPermissionForm.count') do
      post :create, camp_permission_form: { address1: @camp_permission_form.address1, address2: @camp_permission_form.address2, approval: @camp_permission_form.approval, business: @camp_permission_form.business, camp: @camp_permission_form.camp, city: @camp_permission_form.city, name: @camp_permission_form.name, phone_number: @camp_permission_form.phone_number, printed_date: @camp_permission_form.printed_date, relationship: @camp_permission_form.relationship, signature_of_guardian: @camp_permission_form.signature_of_guardian, state: @camp_permission_form.state, type: @camp_permission_form.type, user_id: @camp_permission_form.user_id, work_phone_number: @camp_permission_form.work_phone_number, zip: @camp_permission_form.zip }
    end

    assert_redirected_to camp_permission_form_path(assigns(:camp_permission_form))
  end

  test "should show camp_permission_form" do
    get :show, id: @camp_permission_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @camp_permission_form
    assert_response :success
  end

  test "should update camp_permission_form" do
    patch :update, id: @camp_permission_form, camp_permission_form: { address1: @camp_permission_form.address1, address2: @camp_permission_form.address2, approval: @camp_permission_form.approval, business: @camp_permission_form.business, camp: @camp_permission_form.camp, city: @camp_permission_form.city, name: @camp_permission_form.name, phone_number: @camp_permission_form.phone_number, printed_date: @camp_permission_form.printed_date, relationship: @camp_permission_form.relationship, signature_of_guardian: @camp_permission_form.signature_of_guardian, state: @camp_permission_form.state, type: @camp_permission_form.type, user_id: @camp_permission_form.user_id, work_phone_number: @camp_permission_form.work_phone_number, zip: @camp_permission_form.zip }
    assert_redirected_to camp_permission_form_path(assigns(:camp_permission_form))
  end

  test "should destroy camp_permission_form" do
    assert_difference('CampPermissionForm.count', -1) do
      delete :destroy, id: @camp_permission_form
    end

    assert_redirected_to camp_permission_forms_path
  end
end

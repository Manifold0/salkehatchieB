require 'test_helper'

class ReferenceFormsControllerTest < ActionController::TestCase
  setup do
    @reference_form = reference_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reference_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reference_form" do
    assert_difference('ReferenceForm.count') do
      post :create, reference_form: { approval_status: @reference_form.approval_status, email: @reference_form.email, name: @reference_form.name, printed_date: @reference_form.printed_date, relationship: @reference_form.relationship, reviewed_by_camp_director: @reference_form.reviewed_by_camp_director, user_id: @reference_form.user_id }
    end

    assert_redirected_to reference_form_path(assigns(:reference_form))
  end

  test "should show reference_form" do
    get :show, id: @reference_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reference_form
    assert_response :success
  end

  test "should update reference_form" do
    patch :update, id: @reference_form, reference_form: { approval_status: @reference_form.approval_status, email: @reference_form.email, name: @reference_form.name, printed_date: @reference_form.printed_date, relationship: @reference_form.relationship, reviewed_by_camp_director: @reference_form.reviewed_by_camp_director, user_id: @reference_form.user_id }
    assert_redirected_to reference_form_path(assigns(:reference_form))
  end

  test "should destroy reference_form" do
    assert_difference('ReferenceForm.count', -1) do
      delete :destroy, id: @reference_form
    end

    assert_redirected_to reference_forms_path
  end
end

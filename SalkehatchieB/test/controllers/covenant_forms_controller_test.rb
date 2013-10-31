require 'test_helper'

class CovenantFormsControllerTest < ActionController::TestCase
  setup do
    @covenant_form = covenant_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:covenant_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create covenant_form" do
    assert_difference('CovenantForm.count') do
      post :create, covenant_form: { agree_to_covenant: @covenant_form.agree_to_covenant, child_abuse: @covenant_form.child_abuse, policy: @covenant_form.policy, printed_date: @covenant_form.printed_date, report_abuse: @covenant_form.report_abuse, signature_date: @covenant_form.signature_date, training: @covenant_form.training, two_adult: @covenant_form.two_adult, user_id: @covenant_form.user_id, user_signature: @covenant_form.user_signature }
    end

    assert_redirected_to covenant_form_path(assigns(:covenant_form))
  end

  test "should show covenant_form" do
    get :show, id: @covenant_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @covenant_form
    assert_response :success
  end

  test "should update covenant_form" do
    patch :update, id: @covenant_form, covenant_form: { agree_to_covenant: @covenant_form.agree_to_covenant, child_abuse: @covenant_form.child_abuse, policy: @covenant_form.policy, printed_date: @covenant_form.printed_date, report_abuse: @covenant_form.report_abuse, signature_date: @covenant_form.signature_date, training: @covenant_form.training, two_adult: @covenant_form.two_adult, user_id: @covenant_form.user_id, user_signature: @covenant_form.user_signature }
    assert_redirected_to covenant_form_path(assigns(:covenant_form))
  end

  test "should destroy covenant_form" do
    assert_difference('CovenantForm.count', -1) do
      delete :destroy, id: @covenant_form
    end

    assert_redirected_to covenant_forms_path
  end
end

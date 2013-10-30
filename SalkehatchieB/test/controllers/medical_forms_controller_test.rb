require 'test_helper'

class MedicalFormsControllerTest < ActionController::TestCase
  setup do
    @medical_form = medical_forms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_forms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_form" do
    assert_difference('MedicalForm.count') do
      post :create, medical_form: { additional_conditions: @medical_form.additional_conditions, allergies: @medical_form.allergies, camp_id: @medical_form.camp_id, company_address: @medical_form.company_address, company_number: @medical_form.company_number, date_of_last_tetanus_shot: @medical_form.date_of_last_tetanus_shot, diet_restrictions: @medical_form.diet_restrictions, guardian_approval: @medical_form.guardian_approval, guardian_approval_date: @medical_form.guardian_approval_date, health_insurance_agent: @medical_form.health_insurance_agent, health_insurance_company: @medical_form.health_insurance_company, information: @medical_form.information, insurance_card_image: @medical_form.insurance_card_image, medications: @medical_form.medications, physician_address_1: @medical_form.physician_address_1, physician_address_2: @medical_form.physician_address_2, physician_city: @medical_form.physician_city, physician_name: @medical_form.physician_name, physician_number: @medical_form.physician_number, physician_state: @medical_form.physician_state, physician_zip: @medical_form.physician_zip, policy_number: @medical_form.policy_number, printed_date: @medical_form.printed_date, recent_illness_injury: @medical_form.recent_illness_injury, user_approval: @medical_form.user_approval, user_approval_date: @medical_form.user_approval_date, user_id: @medical_form.user_id }
    end

    assert_redirected_to medical_form_path(assigns(:medical_form))
  end

  test "should show medical_form" do
    get :show, id: @medical_form
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_form
    assert_response :success
  end

  test "should update medical_form" do
    patch :update, id: @medical_form, medical_form: { additional_conditions: @medical_form.additional_conditions, allergies: @medical_form.allergies, camp_id: @medical_form.camp_id, company_address: @medical_form.company_address, company_number: @medical_form.company_number, date_of_last_tetanus_shot: @medical_form.date_of_last_tetanus_shot, diet_restrictions: @medical_form.diet_restrictions, guardian_approval: @medical_form.guardian_approval, guardian_approval_date: @medical_form.guardian_approval_date, health_insurance_agent: @medical_form.health_insurance_agent, health_insurance_company: @medical_form.health_insurance_company, information: @medical_form.information, insurance_card_image: @medical_form.insurance_card_image, medications: @medical_form.medications, physician_address_1: @medical_form.physician_address_1, physician_address_2: @medical_form.physician_address_2, physician_city: @medical_form.physician_city, physician_name: @medical_form.physician_name, physician_number: @medical_form.physician_number, physician_state: @medical_form.physician_state, physician_zip: @medical_form.physician_zip, policy_number: @medical_form.policy_number, printed_date: @medical_form.printed_date, recent_illness_injury: @medical_form.recent_illness_injury, user_approval: @medical_form.user_approval, user_approval_date: @medical_form.user_approval_date, user_id: @medical_form.user_id }
    assert_redirected_to medical_form_path(assigns(:medical_form))
  end

  test "should destroy medical_form" do
    assert_difference('MedicalForm.count', -1) do
      delete :destroy, id: @medical_form
    end

    assert_redirected_to medical_forms_path
  end
end

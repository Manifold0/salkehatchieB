require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionnaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: { accounting: @questionnaire.accounting, bible: @questionnaire.bible, camp: @questionnaire.camp, camp_director_approval: @questionnaire.camp_director_approval, camp_director_approval_date: @questionnaire.camp_director_approval_date, carpentry: @questionnaire.carpentry, cpr_firstaid: @questionnaire.cpr_firstaid, electrical: @questionnaire.electrical, firstaid: @questionnaire.firstaid, involved_activities: @questionnaire.involved_activities, lifeguard: @questionnaire.lifeguard, occupation: @questionnaire.occupation, plumbing: @questionnaire.plumbing, printed_date: @questionnaire.printed_date, recreation: @questionnaire.recreation, roofing: @questionnaire.roofing, site_leader: @questionnaire.site_leader, song_leader: @questionnaire.song_leader, user_approval: @questionnaire.user_approval, user_approval_date: @questionnaire.user_approval_date, user_id: @questionnaire.user_id, why_participate: @questionnaire.why_participate, year: @questionnaire.year }
    end

    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    patch :update, id: @questionnaire, questionnaire: { accounting: @questionnaire.accounting, bible: @questionnaire.bible, camp: @questionnaire.camp, camp_director_approval: @questionnaire.camp_director_approval, camp_director_approval_date: @questionnaire.camp_director_approval_date, carpentry: @questionnaire.carpentry, cpr_firstaid: @questionnaire.cpr_firstaid, electrical: @questionnaire.electrical, firstaid: @questionnaire.firstaid, involved_activities: @questionnaire.involved_activities, lifeguard: @questionnaire.lifeguard, occupation: @questionnaire.occupation, plumbing: @questionnaire.plumbing, printed_date: @questionnaire.printed_date, recreation: @questionnaire.recreation, roofing: @questionnaire.roofing, site_leader: @questionnaire.site_leader, song_leader: @questionnaire.song_leader, user_approval: @questionnaire.user_approval, user_approval_date: @questionnaire.user_approval_date, user_id: @questionnaire.user_id, why_participate: @questionnaire.why_participate, year: @questionnaire.year }
    assert_redirected_to questionnaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionnaires_path
  end
end

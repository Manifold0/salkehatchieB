class QuestionnairesController < ApplicationController
  before_action :set_questionnaire, only: [:show, :edit, :update, :destroy]

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.all
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = QuestionnairePdf.new(@questionnaire)
        send_data pdf.render, filename: "questionnaire", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /questionnaires/new
  def new
    @questionnaire = Questionnaire.new

    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)

    @camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all
  end

  # GET /questionnaires/1/edit
  def edit
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new(questionnaire_params)
    @questionnaire.user = current_user
    @questionnaire.user_approval_date = Time.now

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render action: 'show', status: :created, location: @questionnaire }
      else
        format.html { render action: 'new' }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questionnaires/1
  # PATCH/PUT /questionnaires/1.json
  def update
    @questionnaire.user_approval_date = Time.now
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_questionnaire
      @questionnaire = Questionnaire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def questionnaire_params
      params.require(:questionnaire).permit(:occupation, :why_participate, :carpentry, :plumbing, :electrical, :roofing, :song_leader, :bible, :recreation, :lifeguard, :accounting, :firstaid, :cpr_firstaid, :camp, :year, :site_leader, :involved_activities, :camp_director_approval, :camp_director_approval_date, :user_approval, :user_approval_date, :printed_date, :user_id)
    end
end

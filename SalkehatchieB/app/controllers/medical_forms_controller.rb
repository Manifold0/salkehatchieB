class MedicalFormsController < ApplicationController
  before_action :set_medical_form, only: [:show, :edit, :update, :destroy]

  # GET /medical_forms
  # GET /medical_forms.json
  def index
    @medical_forms = MedicalForm.all
  end

  # GET /medical_forms/1
  # GET /medical_forms/1.json
  def show
    @medical_form = MedicalForm.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = MedicalPdf.new(@medical_form)
        send_data pdf.render, filename: "medical form", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /medical_forms/new
  def new
    @medical_form = MedicalForm.new
  end

  # GET /medical_forms/1/edit
  def edit
  end

  # POST /medical_forms
  # POST /medical_forms.json
  def create
    @medical_form = MedicalForm.new(medical_form_params)
    @medical_form.user = current_user
    respond_to do |format|
      if @medical_form.save
        format.html { redirect_to @medical_form, notice: 'Medical form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @medical_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @medical_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_forms/1
  # PATCH/PUT /medical_forms/1.json
  def update
    respond_to do |format|
      if @medical_form.update(medical_form_params)
        format.html { redirect_to @medical_form, notice: 'Medical form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @medical_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_forms/1
  # DELETE /medical_forms/1.json
  def destroy
    @medical_form.destroy
    respond_to do |format|
      format.html { redirect_to medical_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_form
      @medical_form = MedicalForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_form_params
      params.require(:medical_form).permit(:user_id, :camp_id, :information, :insurance_card_image, :physician_name, :physician_number, :physician_address_1, :physician_address_2, :physician_city, :physician_state, :physician_zip, :health_insurance_company, :policy_number, :company_address, :company_number, :health_insurance_agent, :allergies, :diet_restrictions, :recent_illness_injury, :medications, :additional_conditions, :date_of_last_tetanus_shot, :user_approval, :user_approval_date, :guardian_approval, :guardian_approval_date, :printed_date)
    end
end

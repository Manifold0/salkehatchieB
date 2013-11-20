class CovenantFormsController < ApplicationController
  before_action :set_covenant_form, only: [:show, :edit, :update, :destroy]

  # GET /covenant_forms
  # GET /covenant_forms.json
  def index
    @covenant_forms = CovenantForm.all
  end

  # GET /covenant_forms/1
  # GET /covenant_forms/1.json
  def show
    @covenant_form = CovenantForm.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CovenantPdf.new(@covenant_form)
        pdf.text "Hello World"
        send_data pdf.render, filename: "covenant form", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /covenant_forms/new
  def new
    @covenant_form = CovenantForm.new
  end

  # GET /covenant_forms/1/edit
  def edit
  end

  # POST /covenant_forms
  # POST /covenant_forms.json
  def create
    @covenant_form = CovenantForm.new(covenant_form_params)

    respond_to do |format|
      if @covenant_form.save
        format.html { redirect_to @covenant_form, notice: 'Covenant form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @covenant_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @covenant_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covenant_forms/1
  # PATCH/PUT /covenant_forms/1.json
  def update
    respond_to do |format|
      if @covenant_form.update(covenant_form_params)
        format.html { redirect_to @covenant_form, notice: 'Covenant form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @covenant_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covenant_forms/1
  # DELETE /covenant_forms/1.json
  def destroy
    @covenant_form.destroy
    respond_to do |format|
      format.html { redirect_to covenant_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_covenant_form
      @covenant_form = CovenantForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def covenant_form_params
      params.require(:covenant_form).permit(:user_id, :policy, :two_adult, :training, :report_abuse, :child_abuse, :agree_to_covenant, :user_signature, :signature_date, :printed_date)
    end
end

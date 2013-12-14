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
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CovenantPdf.new(@covenant_form)
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
    @covenant_form.user = current_user

    p = covenant_form_params
    create_for_user = current_user
    if p['user_id'] != nil
      create_for_user = User.find(p['user_id'])
    end

    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)

    number_of_forms = CovenantForm.where("(created_at >= ? AND created_at < ?) and user_id = ?", date_registration_opens, date_registration_closes , create_for_user.id).count

    if (number_of_forms > 0 && !current_user.is_admin?)
      #problem already requested camps.
      render :text => "You have already created "+number_of_forms.to_s+" form between "+date_registration_opens.strftime("%F")+" and "+date_registration_closes.strftime("%F")
      #TO-DO: this needs to show a prettier error.
      #redirect_to request_camps_path
      return
    end



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

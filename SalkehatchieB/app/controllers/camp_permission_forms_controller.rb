class CampPermissionFormsController < ApplicationController
  before_action :set_camp_permission_form, only: [:show, :edit, :update, :destroy]

  # GET /camp_permission_forms
  # GET /camp_permission_forms.json
  def index
    @camp_permission_forms = CampPermissionForm.all
  end

  # GET /camp_permission_forms/1
  # GET /camp_permission_forms/1.json
  def show
    @camp_permission_form = CampPermissionForm.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = CampPermissionPdf.new(@camp_permission_form)
        send_data pdf.render, filename: "camp permission form", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /camp_permission_forms/new
  def new
    @camp_permission_form = CampPermissionForm.new
  end

  # GET /camp_permission_forms/1/edit
  def edit
  end

  # POST /camp_permission_forms
  # POST /camp_permission_forms.json
  def create
    @camp_permission_form = CampPermissionForm.new(camp_permission_form_params)
    @camp_permission_form.user = current_user
    respond_to do |format|
      if @camp_permission_form.save
        format.html { redirect_to @camp_permission_form, notice: 'Camp permission form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @camp_permission_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @camp_permission_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_permission_forms/1
  # PATCH/PUT /camp_permission_forms/1.json
  def update
    respond_to do |format|
      if @camp_permission_form.update(camp_permission_form_params)
        format.html { redirect_to @camp_permission_form, notice: 'Camp permission form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camp_permission_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_permission_forms/1
  # DELETE /camp_permission_forms/1.json
  def destroy
    @camp_permission_form.destroy
    respond_to do |format|
      format.html { redirect_to camp_permission_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_permission_form
      @camp_permission_form = CampPermissionForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_permission_form_params
      params.require(:camp_permission_form).permit(:user_id, :type_of, :relationship, :name, :address1, :address2, :city, :state, :zip, :business, :work_phone_number, :phone_number, :signature_of_guardian, :approval, :camp, :printed_date)
    end
end

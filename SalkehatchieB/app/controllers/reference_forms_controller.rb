class ReferenceFormsController < ApplicationController
  before_action :set_reference_form, only: [:show, :edit, :update, :approve, :destroy]

  # GET /reference_forms
  # GET /reference_forms.json
  def index
    if (params[:campid])
      @reference_forms = Array.new
      Camp.find(params[:campid]).camp_assignments.each do |assignment|
        @reference_forms.concat(assignment.user.reference_form)
      end
    else
      @reference_forms = ReferenceForm.where(user: current_user)
    end
  end

  # GET /reference_forms/1
  # GET /reference_forms/1.json
  def show
    @reference_form = ReferenceForm.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReferencePdf.new(@reference_form)
        send_data pdf.render, filename: "reference form", type: "application/pdf", disposition: "inline"
      end
    end
  end

  # GET /reference_forms/new
  def new
    @reference_form = ReferenceForm.new
  end

  # GET /reference_forms/1/edit
  def edit
  end

  # POST /reference_forms
  # POST /reference_forms.json
  def create
    @reference_form = ReferenceForm.new(reference_form_params)
    @reference_form.user = current_user
    respond_to do |format|
      if @reference_form.save
        format.html { redirect_to @reference_form, notice: 'Reference form was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reference_form }
      else
        format.html { render action: 'new' }
        format.json { render json: @reference_form.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reference_forms/1
  # PATCH/PUT /reference_forms/1.json
  def update
    respond_to do |format|
      if @reference_form.update(reference_form_params)
        format.html { redirect_to @reference_form, notice: 'Reference form was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reference_form.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
  end
  # DELETE /reference_forms/1
  # DELETE /reference_forms/1.json
  def destroy
    @reference_form.destroy
    respond_to do |format|
      format.html { redirect_to reference_forms_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reference_form
      @reference_form = ReferenceForm.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reference_form_params
      params.require(:reference_form).permit(:user_id, :name, :email, :relationship, :approval_status, :reviewed_by_camp_director, :printed_date)
    end
end

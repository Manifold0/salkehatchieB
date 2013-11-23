class CampAssignmentsController < ApplicationController
  before_action :set_camp_assignment, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource

  # GET /camp_assignments
  # GET /camp_assignments.json
  def index
    @camp_assignments = CampAssignment.all
  end

  # GET /camp_assignments/1
  # GET /camp_assignments/1.json
  def show
  end

  # GET /camp_assignments/new
  def new
    @camp_assignment = CampAssignment.new
  end

  # GET /camp_assignments/1/edit
  def edit
    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)
    @camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all
  end

  # POST /camp_assignments
  # POST /camp_assignments.json
  def create
    @camp_assignment = CampAssignment.new(camp_assignment_params)

    respond_to do |format|
      if @camp_assignment.save
        format.html { redirect_to @camp_assignment, notice: 'Camp assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @camp_assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @camp_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camp_assignments/1
  # PATCH/PUT /camp_assignments/1.json
  def update
    respond_to do |format|
      if @camp_assignment.update(camp_assignment_params)
        format.html { redirect_to @camp_assignment, notice: 'Camp assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camp_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_assignments/1
  # DELETE /camp_assignments/1.json
  def destroy
    @camp_assignment.destroy
    respond_to do |format|
      format.html { redirect_to camp_assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_assignment
      @camp_assignment = CampAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_assignment_params
      params.require(:camp_assignment).permit(:user_id, :camp_id, :permission_level)
    end
end

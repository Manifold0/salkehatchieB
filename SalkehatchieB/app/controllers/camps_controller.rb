class CampsController < ApplicationController
  before_action :set_camp, only: [:show, :edit, :update, :destroy, :camp_params, :campers, :forms]
  before_action :create_camp, only: :create
  before_action :permissions, except: [:index, :show]
  before_action :show_permissions, only: :show

  #CanCan specific authorization
  #load_and_authorize_resource handled by permission before_actions above

  # GET /camps
  # GET /camps.json
  def index
    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)
    @camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all
  end

  # GET /camps/1
  # GET /camps/1.json
  def show
  end

  # GET /camps/new
  def new
    @camp = Camp.new
  end

  # GET /camps/1/edit
  def edit

  end

  # POST /camps
  # POST /camps.json
  def create
    
  end

  # PATCH/PUT /camps/1
  # PATCH/PUT /camps/1.json
  def update
    respond_to do |format|
      if @camp.update(camp_params)
        format.html { redirect_to @camp, notice: 'Camp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camps/1
  # DELETE /camps/1.json
  def destroy
    @camp.destroy
    respond_to do |format|
      format.html { redirect_to camps_url }
      format.json { head :no_content }
    end
  end

  def campers
    @assignments = @camp.camp_assignments.all
  end

  def forms
    
  end

  def home

  end

   def load_camp
     @camp = Camp.new(camp_params)
   end

  def update_camp_assignments
    #TODO
    @camp = current_user.camp

  end

  def manage_campers
    #TODO
    @camp = current_user.camp
    @users = User
  end

  def print_health_info
    #TODO
     @camp = current_user.camp
     @users = User.where(camp: @camp).order(:site)
  end

  def roster_listing
    @camp = current_user.camp
    @users = User.where(camp: @camp)
  end

  def update_schedule
    @camp = current_user.camp
    #might need to add this property
    camp.schedule
  end

  def missing_insurance_cards
    #TODO
    #look to queries_controller.rb for definition
    camp = Camps.find(params[:campid])
    @users = Array.new
    camp.camp_assignments.each do |assignment|
      if !assignment.user.medical_form
        @users.push(assignment.user)
      end
    end
  end

  def get_camp_link(camp)
    if current_user.is_admin?
      return admin_camp_path(camp)
    else
      return camp_path(camp) 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp
      @camp = Camp.find(params[:campid])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_params
      params.require(:camp).permit(:start_date, :end_date, :city, :hq_address)
    end

    def create_camp
      @camp = Camp.new(camp_params)

      respond_to do |format|
        if @camp.save
          
          format.html { redirect_to admin_camp_url(@camp), notice: 'Camp was successfully created.' }
          #format.json { render action: 'show', status: :created, location: @camp }
        else
          format.html { render action: 'new' }
          format.json { render json: @camp.errors, status: :unprocessable_entity }
        end
      end
    end

    def permissions
      if current_user.permission_level == 5
        return
      end
      current_user.current_camps_assigned.each do |assignment|
        if assignment.permission_level > 3 && @camp == assignment.camp
          return
        end
      end
      redirect_to camp_path(@camp)
    end

    def show_permissions
      if current_user.permission_level == 5
        return
      end
      current_user.current_camps_assigned.each do |assignment|
        if @camp == assignment.camp
          return
        end
      end
      redirect_to camps_path
    end
  end


class CampRequestsController < ApplicationController
  before_action :before_for_params, only: [:create]
  before_action :set_camp_request, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /camp_requests
  # GET /camp_requests.json
  def index
    @camp_requests = CampRequest.where(status: false)
  end

  def assign
    p = params.permit(:user, :camp, :camp_request)

    request = CampRequest.find(p['camp_request'])
    if request.user.current_balance != 0 && current_user.background_check_valid?
      redirect_to camp_requests_path
    end
    
    request.status = 1

    if !request.save
      redirect_to camp_requests_path
    end

    assignment = CampAssignment.new(camp: Camp.find(p['camp']), user: User.find(p['user']), permission_level: 1)

    if assignment.save
      redirect_to camp_requests_path
    else
      render action: 'show'
    end

  end

  # GET /camp_requests/1
  # GET /camp_requests/1.json
  def show
  end

  # GET /camp_requests/new
  def new
    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)

    @camp_requests = CampRequest.where(user: current_user,status: false).where("(created_at >= ? AND created_at < ?)", date_registration_opens, date_registration_closes)
    if (@camp_requests.count > 0)
      @camp_request = @camp_requests[0]
    else
      @camp_request = CampRequest.new
    end
    
    @camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all

  end

  # GET /camp_requests/1/edit
  def edit
    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)
    
    @camps = Camp.where("(start_date >= ? AND start_date < ?)", date_registration_opens, date_registration_closes).all

  end

  # POST /camp_requests
  # POST /camp_requests.json
  def create
    p = camp_request_params

    create_for_user = current_user
    if p['user_id'] != nil
      create_for_user = User.find(p['user_id'])
    end

    current_year = DateTime.now.year
    date_registration_opens = DateTime.new(current_year, 1, 1)
    date_registration_closes = DateTime.new(current_year+1, 1, 1)
    
    number_of_times_currently_registered = CampRequest.where("(created_at >= ? AND created_at < ?) and user_id = ?", date_registration_opens, date_registration_closes , create_for_user.id).count

    if (number_of_times_currently_registered > 0 && !current_user.is_admin?)
      #problem already requested camps.
      render :text => "User already created "+number_of_times_currently_registered.to_s+" request between "+date_registration_opens.strftime("%F")+" and "+date_registration_closes.strftime("%F")
      #TO-DO: this needs to show a prettier error.
      #redirect_to request_camps_path
      return
    end

    @camp_request = CampRequest.new(p)
    @camp_request.user = create_for_user

    if @camp_request.save
      if current_user.is_admin?
        redirect_to camp_requests_path
      else
        redirect_to payments_path
      end
    else
      render action: 'new'
    end


=begin    respond_to do |format|
      if @camp_request.save

        #format.json { render action: 'show', status: :created, location: @camp_request }

        redirect_to root_path

      else
        format.html { render action: 'new' }
        format.json { render json: @camp_request.errors, status: :unprocessable_entity }
      end
  end
=end 
  end

  # PATCH/PUT /camp_requests/1
  # PATCH/PUT /camp_requests/1.json
  def update
    respond_to do |format|
      if @camp_request.update(camp_request_params)
        format.html { redirect_to @camp_request, notice: 'Camp request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @camp_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camp_requests/1
  # DELETE /camp_requests/1.json
  def destroy
    @camp_request.destroy
    respond_to do |format|
      format.html { redirect_to camp_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camp_request
      @camp_request = CampRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def camp_request_params
      params.require(:camp_request).permit(:user_id, :camp_id, :status, :preference1_id, :preference2_id, :preference3_id)
    end

    def before_for_params
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
    end
end

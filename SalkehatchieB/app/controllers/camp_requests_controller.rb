class CampRequestsController < ApplicationController
  before_action :set_camp_request, only: [:show, :edit, :update, :destroy]

  # GET /camp_requests
  # GET /camp_requests.json
  def index
    @camp_requests = CampRequest.find(:all, :order => "status ASC")
  end

  def assign
    p = params.permit(:user, :camp, :camp_request)

    request = CampRequest.find(p['camp_request'])
    
    request.status = 1

    if !request.save
      redirect_to camp_requests_path
    end

    assignment = CampAssignment.new(camp: Camp.find(p['camp']), user: User.find(p['user']), permission_level: 1)

    if assignment.save
      redirect_to camp_requests_path
    else
      render action: 'new'
    end


  end

  # GET /camp_requests/1
  # GET /camp_requests/1.json
  def show
  end

  # GET /camp_requests/new
  def new
    @camp_request = CampRequest.new
  end

  # GET /camp_requests/1/edit
  def edit
  end

  # POST /camp_requests
  # POST /camp_requests.json
  def create
    p = camp_request_params

    @camp_request = CampRequest.new(p)
    @camp_request.user = current_user

    if @camp_request.save
      redirect_to root_path
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
end

class UsersController < ApplicationController
  load_and_authorize_resource
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :update_basic_info, only: :update

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update

  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


  def background_check?
    #TODO
  end

  def unpaid_users
    #TODO
  end

  def unassigned_users
     #TODO
  end

  def total_adults
    #TODO
  end

  def total_youth
    #TODO


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if (params[:id])
        @user = User.find(params[:id])
      else
        @user = current_user
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      if current_user.is_admin?
        params.require(:user).permit(:last_name, :first_name, :preferred_name, :address_line1, :address_line2,
        :city, :state, :district, :gender, :tshirt_size, :date_of_birth, :phone_number, :mobile_devices,
        :service_provider, :church, :church_city, :church_pastor,:permission_level,:background_check, :background_check_date)
 
      else
      params.require(:user).permit(:last_name, :first_name, :preferred_name, :address_line1, :address_line2,
        :city, :state, :district, :gender, :tshirt_size, :date_of_birth, :phone_number, :mobile_devices,
        :service_provider, :church, :church_city, :church_pastor,:permission_level)
      end
    end

    def update_basic_info
      respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    end
end

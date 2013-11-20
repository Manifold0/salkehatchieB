class CostsController < ApplicationController
  before_action :set_cost, only: [:show, :edit, :update, :destroy]
  before_action :create_costs, only: :create

  # GET /costs
  # GET /costs.json
  def index
    @costs = Cost.all
  end

  # GET /costs/1
  # GET /costs/1.json
  def show
  end

  # GET /costs/new
  def new
    @cost = Cost.new
  end

  # GET /costs/1/edit
  def edit
  end

  # POST /costs
  # POST /costs.json
  def create
    
  end

  # PATCH/PUT /costs/1
  # PATCH/PUT /costs/1.json
  def update
    respond_to do |format|
      if @cost.update(cost_params)
        format.html { redirect_to @cost, notice: 'Cost was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.json
  def destroy
    @cost.destroy
    respond_to do |format|
      format.html { redirect_to costs_url }
      format.json { head :no_content }
    end
  end

  def approve
    p = params.permit(:cost)

    @cost = Cost.find(p['cost'])
    if (@cost.created_by != current_user)
      @cost.approved_date = DateTime.now
      @cost.admin_approver = current_user

      if @cost.save
        @notice = "Approved"
      else
        @notice = ""

      end

    else
      @notice = "The same admin who set the cost can not approve it."
      #Trying to be approved by the same admin.
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cost
      @cost = Cost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cost_params
      params.require(:cost).permit(:year, :amount, :admin_approver, :approved_date)
    end

    def create_costs
      @cost = Cost.new(cost_params)
      @cost.created_by = current_user

      respond_to do |format|
        if @cost.save
          format.html { redirect_to @cost, notice: 'Cost was successfully created.' }
          format.json { render action: 'show', status: :created, location: @cost }
        else
          format.html { render action: 'new' }
          format.json { render json: @cost.errors, status: :unprocessable_entity }
        end
      end
    end
end

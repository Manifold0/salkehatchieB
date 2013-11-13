class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]

  # GET /payments
  # GET /payments.json
  def index
    if current_user.is_admin?
      @payments = Payment.all
    else
      @payments = Payment.where(:user => current_user)
    end
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments
  # POST /payments.json
  def create
    p = payment_params

    @payment = Payment.new(payment_params)
    @payment.user = current_user

    respond_to do |format|
      if @payment.save
        admin = false
        if admin
          format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @payment }
        else 
          format.html { redirect_to @payment, notice: 'Payment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @payment }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url }
      format.json { head :no_content }
    end
  end

<<<<<<< Updated upstream
  def payments_back
    if current_user.is_admin?
      return admin_payments_path
    else
      return payments_path
    end
  end
=======
  def has_paid?
    #FIXME
    @payment = Payment.where(user_id:params[:id]).sum(:amount)
    @current_cost = Cost.where(year: Time.now.year)
    @balance = @current_cost.amount - @payment
     if balance == 0
       return true
      else
      return false
      end
    end
>>>>>>> Stashed changes

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_params
      params.require(:payment).permit(:user_id, :year, :amount, :identifier)
    end
end

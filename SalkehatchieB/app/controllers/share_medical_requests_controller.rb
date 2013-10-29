class ShareMedicalRequestsController < ApplicationController
  before_action :set_share_medical_request, only: [:show, :edit, :update, :destroy]

  # GET /share_medical_requests
  # GET /share_medical_requests.json
  def index
    @share_medical_requests = ShareMedicalRequest.all
  end

  # GET /share_medical_requests/1
  # GET /share_medical_requests/1.json
  def show
  end

  # GET /share_medical_requests/new
  def new
    @share_medical_request = ShareMedicalRequest.new
  end

  # GET /share_medical_requests/1/edit
  def edit
  end

  # POST /share_medical_requests
  # POST /share_medical_requests.json
  def create
    @share_medical_request = ShareMedicalRequest.new(share_medical_request_params)

    respond_to do |format|
      if @share_medical_request.save
        format.html { redirect_to @share_medical_request, notice: 'Share medical request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @share_medical_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @share_medical_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /share_medical_requests/1
  # PATCH/PUT /share_medical_requests/1.json
  def update
    respond_to do |format|
      if @share_medical_request.update(share_medical_request_params)
        format.html { redirect_to @share_medical_request, notice: 'Share medical request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @share_medical_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /share_medical_requests/1
  # DELETE /share_medical_requests/1.json
  def destroy
    @share_medical_request.destroy
    respond_to do |format|
      format.html { redirect_to share_medical_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_share_medical_request
      @share_medical_request = ShareMedicalRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def share_medical_request_params
      params.require(:share_medical_request).permit(:references, :references)
    end
end

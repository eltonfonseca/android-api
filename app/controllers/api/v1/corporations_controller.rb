class Api::V1::CorporationsController < Api::V1::ApiController
 
  before_action :set_corporation, only: [:show, :update, :destroy]

  # GET /api/v1/corporations
  def index
    @corporations = Corporation.all
    render json: @corporations
  end
  
  # GET /api/v1/corporations/1
  def show
    render json: @corporation
  end
  
  # POST /api/v1/corporations
  def create
    @corporation = Corporation.new(corporation_params)
    if @corporation.save
      render json: @corporation, status: :created
    else
      render json: @corporation.errors, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /api/v1/corporations/1
  def update
    if @corporation.update(corporation_params)
      render json: @corporation
    else
      render json: @corporation.errors, status: :unprocessable_entity
    end
  end
  
  # DELETE /api/v1/corporations/1
  def destroy
    @corporation.destroy
  end
  
  private

  def set_corporation
    @corporation = Corporation.find(params[:id])
  end

  def corporation_params
    params.permit(:name, :ceo, :market_price, :date_foundation, :description)
  end
end
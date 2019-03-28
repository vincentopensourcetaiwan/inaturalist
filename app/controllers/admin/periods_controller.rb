class Admin::PeriodsController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized
  before_action :set_period, only: [:show, :edit, :update, :destroy]

  # GET /periods
  # GET /periods.json
  def index
    authorize Period
    @periods = Period.all
  end

  # GET /periods/1
  # GET /periods/1.json
  def show
    authorize @period
  end

  # GET /periods/new
  def new
    @period = Period.new
    authorize @period
  end

  # GET /periods/1/edit
  def edit
    authorize @period
  end

  # POST /periods
  # POST /periods.json
  def create
    @period = Period.new(period_params)
    authorize @period

    respond_to do |format|
      if @period.save
        format.html { redirect_to admin_periods_path, notice: 'Period was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /periods/1
  # PATCH/PUT /periods/1.json
  def update
    authorize @period
    respond_to do |format|
      if @period.update(period_params)
        format.html { redirect_to admin_periods_path, notice: 'Period was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /periods/1
  # DELETE /periods/1.json
  def destroy
    authorize @period
    @period.destroy
    respond_to do |format|
      format.html { redirect_to admin_periods_path, notice: 'Period was successfully destroyed.' }
    end
  end

  def search
    authorize Period
    render json: Period.where("name like ?", "%#{params[:q]}%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_period
    @period = Period.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def period_params
    params.require(:period).permit(:name, :start_year, :start_month, :start_day, :end_year, :end_month, :end_day, :search_name)
  end
end

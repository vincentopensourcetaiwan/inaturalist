class Admin::ObservationsController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized

  HIT_PER_PAGE = 25

  def index
    authorize Observation
    respond_to do |format|
      format.html
      format.json { render json: ObservationDatatable.new(params) }
    end
  end

  def edit
    @observation = Observation.find(params[:id])
    authorize @observation
  end

  def update
    @observation = Observation.find(params[:id])
    authorize @observation
    @observation.update(observation_params)
    redirect_to admin_observations_path
  end

  def observation_params
    params.require(:observation).permit(:user_id, :category_id, :name, :tag_tokens, :place_tokens, :period_tokens, :disabled)
  end


  def permitted_params
    params.permit(:keyword)
  end

end
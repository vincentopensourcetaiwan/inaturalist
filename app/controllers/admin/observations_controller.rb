class Admin::ObservationsController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @keyword = permitted_params["keyword"]
    @observations = Observation.search(@keyword, { hitsPerPage: Observation::HIT_PER_PAGE, page: params[:page] })
    authorize Observation
  end

  def edit_user
    @observation = Observation.find(params[:observation_id])
    authorize @observation
  end

  def update_user
    @observation = Observation.find(params[:observation_id])
    authorize @observation
    @observation.update(observation_params)
    redirect_to admin_observations_path
  end

  def observation_params
    params.require(:observation).permit(:user_id)
  end


  def permitted_params
    params.permit(:keyword)
  end

end
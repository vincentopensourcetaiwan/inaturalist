class Admin::ObservationsController < ApplicationController
  include Pundit
  layout "admin"
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    authorize Observation
    @keyword = permitted_params["keyword"]
    @observations = Observation.search(@keyword, { hitsPerPage: Observation::HIT_PER_PAGE, page: params[:page] })
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
    params.require(:observation).permit(:user_id, :category_id, :name, :tag_tokens)
  end


  def permitted_params
    params.permit(:keyword)
  end

end
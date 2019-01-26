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

  def permitted_params
    params.permit(:keyword)
  end

end
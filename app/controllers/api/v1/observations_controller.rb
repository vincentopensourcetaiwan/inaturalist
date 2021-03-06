class Api::V1::ObservationsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @observations = Observation.includes(:user, :photos).enabled.search(permitted_params["keyword"]).order_by_id_desc
  end

  def permitted_params
    params.permit(:keyword)
  end

end
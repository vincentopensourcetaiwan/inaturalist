class Apis::V1::ObservationsController < ApplicationController

  def index
    @observations = Observation.enabled.search(permitted_params["keyword"])
  end

  def permitted_params
    params.permit(:keyword)
  end

end
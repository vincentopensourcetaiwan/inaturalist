class VisitorsController < ApplicationController
  layout false

  def search
  end

  def search_results
    @observations = Observation.search(permitted_params["keyword"])
  end

  def permitted_params
    params.permit(:keyword)
  end

end
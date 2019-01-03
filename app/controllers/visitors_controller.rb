class VisitorsController < ApplicationController
  layout false

  def search
  end

  def search_results
    @keyword = permitted_params["keyword"]
    @observations = Observation.search(@keyword)
  end

  def permitted_params
    params.permit(:keyword)
  end

end
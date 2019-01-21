class VisitorsController < ApplicationController
  layout false

  def search
  end

  def search_results
    @keyword = permitted_params["keyword"]
    @observations = Observation.search(@keyword, { hitsPerPage: Observation::HIT_PER_PAGE, page: params[:page] })
  end

  def permitted_params
    params.permit(:keyword)
  end

end
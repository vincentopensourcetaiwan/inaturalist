class VisitorsController < ApplicationController
  def search
    render layout: false
  end

  def search_results
    keyword = permitted_params["keyword"]
    if (keyword.nil?) || (keyword == "")
      @observations = []
    else
      @observations = Observation.search(keyword)
    end
    render layout: false
  end

  def permitted_params
    params.permit(:keyword)
  end

end
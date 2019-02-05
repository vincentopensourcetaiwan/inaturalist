class VisitorsController < ApplicationController
  layout false
  ZOOM_FOR_PLACE = 20
  ZOOM_FOR_OTHERS = 10
  HIT_PER_PAGE = 25

  def search
  end

  def search_advance
  end

  def search_results
    sentence = []
    user = permitted_params["user"]
    category = permitted_params["category"]
    place = permitted_params["place"]
    keyword = permitted_params["keyword"]

    keywords = keyword.split(" ")
    keywords.each do |keyword|
      sentence << keyword
    end
    sentence << user if user.present?
    sentence << category if category.present?
    sentence << place if place.present?

    @search_sentence = sentence.join(" ")
    @observations = Observation.search(@search_sentence, { hitsPerPage: HIT_PER_PAGE, page: params[:page] })

    observation_ids = @observations.pluck(:id)
    @longitude = Observation.where(id: observation_ids).average(:longitude)
    @latitude = Observation.where(id: observation_ids).average(:latitude)

    places = Place.all.pluck(:chinese_name)
    regexp = /#{places.join("|")}/
    @zoom = regexp === @search_sentence ? ZOOM_FOR_PLACE : ZOOM_FOR_OTHERS
    @no_hit_message = @observations.empty? ? "沒有符合的資料" : ""
  end

  def permitted_params
    params.permit(:keyword, :user, :category, :place)
  end

end
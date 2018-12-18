class VisitorsController < ApplicationController
  require "net/https"
  require "uri"
  require "json"

  def index
    permitted = params.permit(:keyword)
    attributes = permitted.to_h || {}
    attributes.values

    @keyword_string = attributes[:keyword]
    if (@keyword_string.nil?) || (@keyword_string == "")
      @resutls = []
    else
      convert = { :url => attributes[:keyword] }.to_query
      keyword = convert.split("=")[1]
      @observations = InaturalistService.search_observations(keyword)
    end
  end

  def show_tags
    permitted = params.permit(:observation_id)
    attributes = permitted.to_h || {}
    attributes.values

    @observation_id = attributes[:observation_id]
    observation = InaturalistService.show_observation(@observation_id)
    @tags = observation.last["description"].split(",")
  end

  def add_tag
    permitted = params.permit(:tag, :observation_id)
    attributes = permitted.to_h || {}
    attributes.values

    @tag = attributes[:tag]
    @observation_id = attributes[:observation_id]

    # get api token
    token = session[:token]
    api_token = InaturalistService.get_api_token(token)

    # get tags
    observation = InaturalistService.show_observation(@observation_id)
    @tags = observation.last["description"].split(",")

    # new tags
    @tags << @tag
    description = ""
    @tags.each do |tag|
      description = description + "#{tag}, "
    end
    description.chop!.chop!

    InaturalistService.update_observation_description(@observation_id, description, api_token)

    redirect_to show_tags_path(observation_id: @observation_id)
  end


  def delete_tag
    permitted = params.permit(:tag, :observation_id)
    attributes = permitted.to_h || {}
    attributes.values

    @tag = attributes[:tag].strip!
    @observation_id = attributes[:observation_id]

    # get api token
    token = session[:token]
    api_token = InaturalistService.get_api_token(token)

    # get tags
    observation = InaturalistService.show_observation(@observation_id)
    @tags = observation.last["description"].split(",")

    # new tags
    @tags.each do |tag|
      tag.strip!
    end
    @tags.delete(@tag)
    description = ""
    @tags.each do |tag|
      description = description + "#{tag}, "
    end
    description.chop!.chop!

    test = InaturalistService.update_observation_description(@observation_id, description, api_token)
    binding.pry

    redirect_to show_tags_path(observation_id: @observation_id)

  end
end
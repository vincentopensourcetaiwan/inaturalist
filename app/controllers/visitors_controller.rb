class VisitorsController < ApplicationController
  require "net/https"
  require "uri"
  require "json"

  def search
    render layout: false
  end

  def search_results
    @keyword_string = permitted_params["keyword"]
    if (@keyword_string.nil?) || (@keyword_string == "")
      @resutls = []
    else
      convert = { :url => @keyword_string }.to_query
      keyword = convert.split("=")[1]
      @observations = InaturalistService.search_observations(keyword)
    end
    render layout: false
  end

  def index
    @keyword_string = permitted_params["keyword"]
    if (@keyword_string.nil?) || (@keyword_string == "")
      @resutls = []
    else
      convert = { :url => @keyword_string }.to_query
      keyword = convert.split("=")[1]
      @observations = InaturalistService.search_observations(keyword)
    end
  end

  def show_tags
    @observation_id = permitted_params["observation_id"]
    observation = InaturalistService.show_observation(@observation_id)
    @tags = observation.last["description"].split(",")
  end

  def add_tag
    @tag = permitted_params["tag"]
    @observation_id = permitted_params["observation_id"]

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
    Ø
    InaturalistService.update_observation_description(@observation_id, description, api_token)

    redirect_to show_tags_path(observation_id: @observation_id)
  end


  def delete_tag
    @tag = permitted_params["tag"].strip!
    @observation_id = permitted_params["observation_id"]

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

    InaturalistService.update_observation_description(@observation_id, description, api_token)

    redirect_to show_tags_path(observation_id: @observation_id)

  end

  def permitted_params
    params.permit(:keyword, :observation_id, :tag)
  end

end
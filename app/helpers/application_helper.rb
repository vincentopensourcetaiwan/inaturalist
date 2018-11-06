module ApplicationHelper
  def show_tags(observation)
    return_straing = ""
    description = observation["description"]
    if description.present?
      tags = description.delete(' ').split(",")
      tags.each do |tag|
        return_straing = return_straing + tag_label(tag)
      end
    end
    return_straing.html_safe
  end

  def tag_label(tag)
    "<span class='badge badge-inverse'>#{tag}</span>&nbsp"
  end
end

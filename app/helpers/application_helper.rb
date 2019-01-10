module ApplicationHelper
  def show_taxon_name(observation)
    if observation.chinese_taxon_name.present?
      "#{observation.chinese_taxon_name}（#{observation.taxon_name}）".html_safe
    else
      "#{observation.taxon_name}"
    end
  end


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
    "<span class='label label-lg label-inverse arrowed arrowed-in-right'>#{tag}</span>&nbsp".html_safe
    # "<span class='badge badge-lg badge-inverse'>#{tag}</span>&nbsp".html_safe
  end
end

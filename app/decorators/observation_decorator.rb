class ObservationDecorator < Draper::Decorator
  delegate_all

  def disabled

      "<span class='badge badge-danger'>#{object.disabled}</span>".html_safe if object.disabled == true
  end

  def photos
    object.photos.map { |photo| "<a href='#{photo.url.gsub('square', 'original')}' data-lightbox='#{photo.id}'><img class='example-image' src='#{photo.url}'></a>" }.join("<br><br>").html_safe
  end

  def tags
    object.tags.map { |tag| "<span class='badge badge-success'>#{tag.name}</span>" }.join("<br><br>").html_safe
  end

  def places
    object.places.map { |place| "<span class='label label-info arrowed'>#{place.chinese_name}</span>" }.join("<br><br>").html_safe
  end

  def periods
    object.periods.map { |period| "<span class='label label-inverse arrowed'>#{period.name}</span>" }.join("<br><br>").html_safe
  end

  def chinese_wikipedia
    if object.name.present?
      h.link_to "顯示於維基百科", "https://zh.wikipedia.org/zh-tw/#{object.name}", target: "_blank"
    else
      h.link_to "顯示於維基百科", "https://zh.wikipedia.org/zh-tw/#{object.taxon_name}", target: "_blank"
    end
  end

  def english_wikipedia
    h.link_to "View on Wikipedia", object.wikipedia_url, target: "_blank" if object.wikipedia_url.present?
  end

  def inaturalist
    h.link_to "View on iNaturalist", object.uri, target: "_blank" if object.uri.present?
  end

  def photo_uploader
    if object.user_icon.present?
      "<a target='_blank' href='https://www.inaturalist.org/people/#{object.user_login}'><img src='#{object.user_icon}'></a><br><a target='_blank' href='https://www.inaturalist.org/people/#{object.user_login}'>#{object.user_login}</a>".html_safe
    else
      "<a target='_blank' href='https://www.inaturalist.org/people/#{object.user_login}'>#{object.user_login}</a>".html_safe
    end
  end

  def photo_photographer
    if object.user&.inaturalist_icon_url.present?
      "<a target='_blank' href='https://www.inaturalist.org/people/#{object.user&.inaturalist_login}'><img src='#{object.user&.inaturalist_icon_url}'></a><br><a target='_blank' href='https://www.inaturalist.org/people/#{object.user&.inaturalist_login}'>#{object.user&.nickname}</a>".html_safe
    else
      "<a target='_blank' href='https://www.inaturalist.org/people/#{object.user&.inaturalist_login}'>#{object.user&.nickname}</a>".html_safe
    end
  end

  def operations
    edit_button(h.edit_admin_observation_path(object), false, "default")
  end

  def edit_button(link, open_new_window, size)
    case size
    when "default"
      "<a href='#{link}' class='btn btn-info' #{open_new_window ? "target='_blank'" : ''}><i class='ace-icon fa fa-pencil'></i></a>".html_safe
    when "xs"
      "<a href='#{link}' class='btn btn-xs btn-info' #{open_new_window ? "target='_blank'" : ''}><i class='ace-icon fa fa-pencil'></i></a>".html_safe
    else
      "<a href='#{link}' class='btn btn-info' #{open_new_window ? "target='_blank'" : ''}><i class='ace-icon fa fa-pencil'></i></a>".html_safe
    end
  end

end
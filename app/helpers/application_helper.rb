module ApplicationHelper
  def new_button(link)
    "<a href='#{link}' class='btn btn-primary'>new</a>".html_safe
  end

  def show_button(link)
    "<a href='#{link}' class='btn btn-xs btn-success' target='_blank'><i class='ace-icon fa fa-check'></i></a>".html_safe
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

  def destroy_button(link, enabled)
    if enabled
      "<a href='#{link}' data-confirm='Are you sure?' rel='nofollow' data-method='delete' class='btn btn-xs btn-danger' id='destroy'><i class='ace-icon fa fa-trash-o'></i></a>".html_safe
    else
      "<a href='#{link}' data-confirm='Are you sure?' rel='nofollow' data-method='delete' class='btn btn-xs btn-danger' disabled><i class='ace-icon fa fa-trash-o'></i></a>".html_safe
    end
  end

  def show_cancel_link
    "<a href=#{request.referrer} class='btn'>Cancel</a>".html_safe
  end

  def submit_button(f)
    f.button :submit, class: "btn btn-primary", id: "submit"
  end

  def show_page(page, total_hits_count)
    current_page = (page || 1).to_i
    "顯示第 #{(current_page - 1) * Observation::HIT_PER_PAGE + 1} 至 #{current_page * Observation::HIT_PER_PAGE }項結果，共 #{total_hits_count} 項結果。"
  end

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
  end
end

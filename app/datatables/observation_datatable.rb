class ObservationDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      disabled: { source: "Observation.disabled" },
      id: { source: "Observation.id" },
      inaturalist_id: { source: "Observation.inaturalist_id" },
      photos: { source: "Observation.id" },
      description: { source: "Observation.description" },
      taxon_name: { source: "Observation.taxon_name" },
      chinese_taxon_name: { source: "Observation.chinese_taxon_name" },
      category_chinese_name: { source: "Category.chinese_name" },
      category_english_name: { source: "Category.name" },
      tags: { source: "Tag.name" },
      places: { source: "Place.chinese_name" },
      periods: { source: "Period.name" },
      chinese_wikipedia: { source: "Observation.name" },
      english_wikipedia: { source: "Observation.taxon_name" },
      inaturalist: { source: "Observation.inaturalist_id" },
      name: { source: "Observation.name" },
      photo_uploader: { source: "Observation.user_login" },
      photo_photographer: { source: "User.nickname" },
      created_at: { source: "Observation.created_at" },
      updated_at: { source: "Observation.updated_at" },
      operations: { source: "Observation.id" }
    }
  end

  def data
    records.map do |record|
      {
        disabled: record.decorate.disabled,
        id: record.id,
        inaturalist_id: record.inaturalist_id,
        photos: record.decorate.photos,
        description: record.description,
        taxon_name: record.taxon_name,
        chinese_taxon_name: record.chinese_taxon_name,
        category_chinese_name: record.category&.chinese_name,
        category_english_name: record.category&.name,
        tags: record.decorate.tags,
        places: record.decorate.places,
        periods: record.decorate.periods,
        chinese_wikipedia: record.decorate.chinese_wikipedia,
        english_wikipedia: record.decorate.english_wikipedia,
        inaturalist: record.decorate.inaturalist,
        name: record.name,
        photo_uploader: record.decorate.photo_uploader,
        photo_photographer: record.decorate.photo_photographer,
        created_at: record.created_at,
        updated_at: record.updated_at,
        operations: record.decorate.operations
      }
    end
  end

  def get_raw_records
    Observation.includes(:photos, :category, :tags, :places, :periods, :user).references(:category, :tags, :places, :periods, :user)
  end

end

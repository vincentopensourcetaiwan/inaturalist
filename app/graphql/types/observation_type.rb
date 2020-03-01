module Types
  class ObservationType < Types::BaseObject
    field :id, ID, null: false
    field :inaturalist_id, Int, null: true
    field :uri, String, null: true
    field :photo_url, String, null: true
    field :taxon_name, String, null: true
    field :description, String, null: true
    field :user_name, String, null: true
    field :user_login, String, null: true
    field :user_icon, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    field :longitude, Float, null: true
    field :latitude, Float, null: true
    field :wikipedia_url, String, null: true
    field :chinese_taxon_name, String, null: true
    field :user_id, Int, null: true
    field :category_id, Int, null: true
    field :category_name, String, null: true
    field :observed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :name, String, null: true
    field :disabled, Boolean, null: true
  end
end
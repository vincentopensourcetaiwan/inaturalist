module Types
  class UserType < Types::BaseObject
    field :id, Int, null: false
    field :inaturalist_icon_url, String, null: true
    field :nickname, String, null: true
  end
end
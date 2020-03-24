module Types
  class PhotoType < Types::BaseObject
    field :id, Int, null: false
    field :url, String, null: true
  end
end
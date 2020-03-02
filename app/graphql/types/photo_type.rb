module Types
  class PhotoType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: true
  end
end
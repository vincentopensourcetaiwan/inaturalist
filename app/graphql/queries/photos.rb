module Queries
  class Photos < Queries::BaseQuery
    description "all photos"

    type [Types::PhotoType], null: false


    def resolve
      Photo.all
    end


  end
end
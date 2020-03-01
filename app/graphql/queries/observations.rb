module Queries
  class Observations < Queries::BaseQuery
    description "all observations"

    argument :keyword, String, required: false


    type [Types::ObservationType], null: false


    def resolve(keyword: nil)
      Observation.enabled.search(keyword).order_by_id_desc
    end


  end
end
module Types
  class QueryType < Types::BaseObject
    field :observations, resolver: Queries::Observations
    field :photos, resolver: Queries::Photos
  end
end

module Types
  class QueryType < Types::BaseObject
    field :observations, resolver: Queries::Observations
  end
end

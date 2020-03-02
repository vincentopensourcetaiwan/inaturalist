class InaturalistSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use BatchLoader::GraphQL
end

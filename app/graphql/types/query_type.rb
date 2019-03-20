module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"

    field :all_movies, [MovieType], null: false

    def all_movies
      Movie.all
    end
  end # class
end # module

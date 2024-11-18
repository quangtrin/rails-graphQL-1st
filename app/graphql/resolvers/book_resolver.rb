module Resolvers
  class BookResolver < GraphQL::Schema::Resolver
    description "Find a book by ID"

    type Types::BookType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      Book.find(id)
    end
  end

  class BooksResolver < GraphQL::Schema::Resolver
    description "Find all books"
    type [ Types::BookType ], null: false
    def resolve
      Book.all
    end
  end
end

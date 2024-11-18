module Resolvers
  class UserResolver < GraphQL::Schema::Resolver
    description "Find a user by ID"
    type Types::UserType, null: true

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end

  class UsersResolver < GraphQL::Schema::Resolver
    description "Find all users"
    type [ Types::UserType ], null: false

    def resolve
      User.all
    end
  end
end

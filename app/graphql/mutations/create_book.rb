# frozen_string_literal: true

module Mutations
  class CreateBook < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end

    field :book, Types::BookType, null: false

    argument :title, String, required: true
    argument :user_id, Integer, required: true

    def resolve(title:, user_id:)
      user = User.find(user_id)
      book = user.books.create!(title: title)
      {
        book: book
      }
    end
  end
end

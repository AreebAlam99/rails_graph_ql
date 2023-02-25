# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :email, String
    field :posts, [Types::PostType], null: false
    field :post_count, Integer, null: false

    def post_count
      object.posts.count
    end
  end
end

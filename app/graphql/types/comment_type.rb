# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :post_id, String, null: false
    field :message, String

    def post_id
      object.user.title
    end
  end
end

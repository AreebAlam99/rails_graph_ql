# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, String, null: false
    field :title, String
    field :body, String

    def user_id
      object.user.name
    end
  end
end

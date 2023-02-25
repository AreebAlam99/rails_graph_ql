module Mutations
  class CreatePost < Mutations::BaseMutation
    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, ID, required: true

    field :post, Types::PostType, null: false
    field :error, [String], null: false

    def resolve(title:, body:, user_id:)
      post = Post.new(title: title ,body: body, user_id: user_id)
      if post.save
        {
          post: post,
          error: []
        }
      else
        {
          post: nil,
          error: post.errors.full_message
        }
      end
    end
  end
end

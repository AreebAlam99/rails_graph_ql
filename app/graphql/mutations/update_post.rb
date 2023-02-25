module Mutations
  class UpdatePost < BaseMutation
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :body, String, required: false

    field :post, Types::PostType, null: false
    field :error, [String], null: false

    def resolve(id:, title:, body:)
      post = Post.find(id).update(title: title, body: body)
      if post
        {
          post: Post.find(id),
          error: []
        }
      else
        {
          post: nil,
          error: "post did not updated"
        }
      end
    end
  end
end

module Mutations
  class CreateComment < Mutations::BaseMutation
    argument :message, String, required: true
    argument :post_id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :error, [String], null: false

    def resolve(message:, post_id:)
      comment = Comment.new(message: message, post_id: post_id)
      if comment.save
        {
          comment: comment,
          error: []
        }
      else
        {
          comment: nil,
          error: comment.errors.full_message
        }
      end
    end
  end
end

module Mutations
  class DestroyPost < BaseMutation
    argument :id, Integer, required: true

    field :message, String, null: false

    def resolve(id:)
      Post.find(id).destroy
      if Post.exists?(id)
        {
          message: 'Post still exists'
        }
      else
        {
          message: 'Post deleted successfully'
        }
      end
    end
  end
end

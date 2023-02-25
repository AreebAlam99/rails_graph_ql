module Mutations
  class DestroyUser < BaseMutation
    argument :id, Integer, required: true

    field :message, String, null: false

    def resolve(id:)
      User.find(id).destroy
      if User.exists?(id)
        {
          message: 'User still exists'
        }
      else
        {
          message: 'User deleted successfully'
        }
      end
    end
  end
end

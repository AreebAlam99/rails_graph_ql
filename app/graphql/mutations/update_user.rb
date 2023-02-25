module Mutations
  class UpdateUser < BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: false
    argument :email, String, required: false

    field :user, Types::UserType, null: false
    field :error, [String], null: false

    def resolve(id:, name:, email:)
      user = User.find(id).update(name: name, email: email)
      if user
        {
          user: User.find(id),
          error: []
        }
      else
        {
          user: nil,
          error: "user did not updated"
        }
      end
    end
  end
end

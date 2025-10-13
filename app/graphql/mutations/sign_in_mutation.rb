module Mutations
  class SignInMutation < BaseMutation
    field :token, String, null: true
    field :error, String, null: true
    field :user, Types::TeacherType || Types::StudentType, null: false

    argument :email, String, required: true
    argument :password, String, required: true
    argument :role, Types::RoleType, required: true

    def resolve(email:, password:, role:)
      raise GraphQL::ExecutionError, "User already signed in" if context[:current_user]

      user = student?(role) ? Student.find_by(email: email) : Teacher.find_by(email: email)
      puts user&.email

      if user&.valid_password?(password)
        token = JsonWebToken.genereate_token({ user_id: user.id, role: role })
        { token: token, error: nil, user: user }
      else
        { token: nil, error: "Username or Password is incorrect" }
      end
    end

    private
      def student?(role)
        role == "STUDENT"
      end
  end
end

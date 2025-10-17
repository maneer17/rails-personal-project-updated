module Mutations
  module Auth
    class SignInMutation < BaseMutation
      field :token, String, null: true
      field :error, String, null: true
      field :user, Types::StudentType|| Types::TeacherType, null: true

      argument :email, String, required: true
      argument :password, String, required: true
      argument :role, Types::RoleType, required: true

      def ready?(**_args)
        true
      end
      def resolve(email:, password:, role:)
        raise GraphQL::ExecutionError, "User already signed in" if context[:current_user]
        user = student?(role) ? Student.find_by(email: email) : Teacher.find_by(email: email)
        if user&.valid_password?(password)
          token = JsonWebToken.genereate_token({ user_id: user.id, role: role })
          { token: token, error: nil, user: user }
        else
          { token: nil, error: "Username or Password is incorrect", user: nil }
        end
      end


      private

      def student?(role)
        role == "STUDENT"
      end
    end
  end
end

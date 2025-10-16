module Mutations
  module Auth
    class SignUpMutation < BaseMutation
      # TODO: define return fields
      # field :post, Types::PostType, null: false
      field :user, Types::StudentType|| Types::TeacherType, null: false
      field :token, String, null: false
      field :errors, String, null: false

      # TODO: define arguments
      # argument :name, String, required: true
      argument :role, Types::RoleType, required: true
      argument :name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true


      # TODO: define resolve method
      def resolve(role:, name:, email:, password:, password_confirmation:)
        user_class = student?(role) ? Student : Teacher
        user = user_class.new(name: name, email: email, password: password, password_confirmation: password_confirmation)
        if user.save!
          token = JsonWebToken.genereate_token({ user_id: user.id, role: role })
          puts token
          { user: user, token: token, errors: [] }
        else
          { errors: user.errors.full_messages }
        end
      end
      def student?(role)
        role == "STUDENT"
      end
    end
  end
end

# frozen_string_literal: true

module Mutations
  class SignInMutation < BaseMutation
    # TODO: define return fields
    field :token, String, null: true
    field :error, String, null: true
    field :student, Types::StudentType

    # TODO: define arguments
    argument :email, String, required: true
    argument :password, String, required: true

    # TODO: define resolve method
    def resolve(email:, password:)
      raise GraphQL::ExecutionError, "User already signed in" if context[:current_user]
      student = Student.find_by(email: email)
      if student&.valid_password?(password)
        token = JsonWebToken.genereate_token(student.id)
        { token: token, error: " ", student: student }
      else
        { error: "Username or Password is incorrect" }
      end
  end
  end
end

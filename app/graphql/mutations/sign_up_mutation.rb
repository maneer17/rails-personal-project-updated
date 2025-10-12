# frozen_string_literal: true

module Mutations
  class SignUpMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :student, Types::StudentType
    field :token, String, null: false
    field :errors, String, null: false

    # TODO: define arguments
    # argument :name, String, required: true
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true
    argument :password_confirmation, String, required: true

    # TODO: define resolve method
    def resolve(name:, email:, password:, password_confirmation:)
      student = Student.create!(name: name, email: email, password: password, password_confirmation: password_confirmation)
      if student.save!
        token = JsonWebToken.genereate_token(student.id)
        { student: student, token: token, errors: "" }
      else
        { errors: student.errors.full_messages }
      end
    end
  end
end

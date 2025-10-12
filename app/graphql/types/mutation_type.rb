# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_enrollment_mutation, mutation: Mutations::CreateEnrollmentMutation
    field :sign_up_mutation, mutation: Mutations::SignUpMutation
    field :sign_in_mutation, mutation: Mutations::SignInMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end

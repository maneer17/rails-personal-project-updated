# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :post_delete, mutation: Mutations::PostDelete
    field :post_update, mutation: Mutations::PostUpdate
    field :create_course__mutation, mutation: Mutations::CreateCourseMutation
    # field :delete_post_mutation, mutation: Mutations::DeletePostMutation
    # field :update_post_mutation, mutation: Mutations::UpdatePostMutation
    field :create_post_mutation, mutation: Mutations::CreatePostMutation
    field :create_enrollment_mutation, mutation: Mutations::CreateEnrollmentMutation
    field :sign_up_mutation, mutation: Mutations::Auth::SignUpMutation
    field :sign_in_mutation, mutation: Mutations::Auth::SignInMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end

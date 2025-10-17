# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_up_mutation, mutation: Mutations::Auth::SignUpMutation
    field :sign_in_mutation, mutation: Mutations::Auth::SignInMutation
    field :create_course_mutation, mutation: Mutations::CreateCourseMutation
    field :post_delete, mutation: Mutations::Posts::PostDelete
    field :post_update, mutation: Mutations::Posts::PostUpdate
    field :create_post_mutation, mutation: Mutations::Posts::CreatePostMutation
    field :create_enrollment_mutation, mutation: Mutations::CreateEnrollmentMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end

# frozen_string_literal: true

module Mutations
  module Posts
    class PostDelete < BaseMutation
      description "Deletes a post by ID"

      field :message, String, null: false

      argument :id, ID, required: true

      def authorized?(id:)
        post = Post.find(id)
        course = post.course
        unless context[:current_user].is_a?(Teacher) && course.teachedBy?(context[:current_user])
          raise GraphQL::ExecutionError, "You are not authorized to perform this action"
        end
        true
      end

      def resolve(id:)
        post = ::Post.find(id)

        unless post.destroy
          raise GraphQL::ExecutionError.new(
            "Error deleting post",
            extensions: post.errors.to_hash
          )
        end

        { message: "Post with ID #{id} has been destroyed successfully" }
      end
    end
  end
end

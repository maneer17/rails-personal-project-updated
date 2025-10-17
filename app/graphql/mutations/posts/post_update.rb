# frozen_string_literal: true

module Mutations
  module Posts
    class PostUpdate < BaseMutation
      description "Updates a post by ID"

      field :post, Types::PostType, null: false

      argument :id, ID, required: true
      argument :post_input, Types::PostInputType, required: true


      def authorized?(id:, **_args)
        post = Post.find(id)
        course = post.course
        unless context[:current_user].is_a?(Teacher) && course.teachedBy?(context[:current_user])
          raise GraphQL::ExecutionError, "You are not authorized to perform this action"
        end
        true
      end

      def resolve(id:, post_input:)
        post = ::Post.find(id)

        unless post.update(post_input.to_h)
          raise GraphQL::ExecutionError.new(
            "Error updating post",
            extensions: post.errors.to_hash
          )
        end

        { post: post }
      end
    end
  end
end

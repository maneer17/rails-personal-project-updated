# frozen_string_literal: true

module Mutations
  module Posts
    class CreatePostMutation < BaseMutation
      field :post, Types::PostType, null: true
      argument :post_input, Types::PostInputType, required: true

      def authorized?(post_input:)
        course = Course.find(post_input.to_h[:course_id])
        unless context[:current_user].is_a?(Teacher) && course.teachedBy?(context[:current_user])
          raise GraphQL::ExecutionError, "You are not authorized to perform this action"
        end
        true
      end

      def resolve(post_input:)
        post = Post.new(post_input.to_h)

        unless post.save
          raise GraphQL::ExecutionError.new(
            "Error creating post",
            extensions: post.errors.to_hash
          )
        end

        { post: post }
      end
    end
  end
end

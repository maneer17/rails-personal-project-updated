# frozen_string_literal: true

module Mutations
  module Teacher
    class PostDelete < BaseMutation
      description "Deletes a post by ID"

      field :message, String, null: false

      argument :id, ID, required: true

      def resolve(id:)
        post = ::Post.find(id)
        raise GraphQL::ExecutionError.new "Error deleting post", extensions: post.errors.to_hash unless post.destroy!

        { message: "post with #{id} has been destroyed successfully" }
      end
    end
  end
end

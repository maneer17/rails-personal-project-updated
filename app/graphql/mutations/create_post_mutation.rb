# frozen_string_literal: true

module Mutations
  class CreatePostMutation < BaseMutation
    # TODO: define return fields
    field :post, Types::PostType, null: true


    argument :post_input, Types::PostInputType, required: true

    def resolve(post_input:)
      post = Post.new(post_input.to_h)
      raise GraphQL::ExecutionError.new "Error creating post", extensions: post.errors.to_hash unless post.save
        { post: post }
      end
  end
end

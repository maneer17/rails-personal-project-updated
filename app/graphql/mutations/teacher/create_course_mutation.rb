# frozen_string_literal: true

module Mutations
  module Teacher
    class CreateCourseMutation < BaseMutation
      # TODO: define return fields
      # field :post, Types::PostType, null: false
      field :course, Types::CourseType, null: true
      field :errors, [ String ], null: false
      argument :name, String, required: true
      argument :description, String, required: false
      def resolve(name:, description:)
        teacher = context[:current_user]
        course = Course.new(name: name, description: description, teacher_id: teacher.id)
        if course.save
          { course: course, errors: [] }
        else
          { course: nil, errors: course.errors.messages }
        end
      end

      # TODO: define arguments
      # argument :name, String, required: true

      # TODO: define resolve method
      # def resolve(name:)
      #   { post: ... }
      # end
    end
  end
end

# frozen_string_literal: true

module Mutations
  class CreateCourseMutation < BaseMutation
    field :course, Types::CourseType, null: true
    argument :course_input, Types::CourseInputType, required: true

    def authorized?(**_args)
      if context[:current_user].is_a?(Teacher)
        true
      else
        raise GraphQL::ExecutionError, "you are not authorized to performe this action"
      end
    end

    def resolve(course_input:)
      course = Course.new(course_input.to_h)
      course.teacher = context[:current_user]
      raise GraphQL::ExecutionError.new "Error createing course", extensions: course.errors.to_hash unless course.save
      { course: course }
    end
  end
end

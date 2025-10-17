# frozen_string_literal: true

module Mutations
  class CreateEnrollmentMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :enrollment, Types::CourseType, null: true

    # TODO: define arguments
    # argument :name, String, required: true
    argument :student_id, ID, required: true
    argument :course_id, ID, required: true

    def resolve(student_id:, course_id:)
      enrollment = StudentCourse.new(student_id: student_id, course_id: course_id)
      raise GraphQL::ExecutionError.new "Error creating enrollment",
       extensions: enrollment.errors.to_hash unless enrollment.save
       { enrollment: Course.find(enrollment.course_id) }
      end
  end
end

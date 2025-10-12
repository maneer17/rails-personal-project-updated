# frozen_string_literal: true

module Mutations
  class CreateEnrollmentMutation < BaseMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false
    field :message, String, null: true

    # TODO: define arguments
    # argument :name, String, required: true
    argument :student_id, ID, required: true
    argument :course_id, ID, required: true

    def resolve(student_id:, course_id:)
      student = Student.find(student_id)
      course = Course.find(course_id)
        if student.courses.include? course
          { message: "already enrolled in this course!" }
        else
          student.courses << course
          { message: "enrolled successfully " }
        end
      end
  end
end

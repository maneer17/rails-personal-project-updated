# frozen_string_literal: true

module Types
  class RoleType < Types::BaseEnum
    description "the user is either a student or a teacher"
    value "STUDENT", "a student user"
    value "TEACHER", "a teacher user"
  end
end

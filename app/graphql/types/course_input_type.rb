# frozen_string_literal: true

module Types
  class CourseInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :description, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
  end
end

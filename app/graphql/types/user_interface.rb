# app/graphql/types/user_interface.rb
module Types
  module UserInterface
    include Types::BaseInterface

    description "Interface for multiple user types: student, teacher"
    field :id, ID, null: false
    field :email, String, null: false
    field :encrypted_password, String, null: false
    field :name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    def resolve_type(object, _context)
      if object.is_a?(::Student)
        Types::StudentType
      elsif object.is_a?(::Teacher)
        Types::TeacherType
      else
        raise "Unexpected User type: #{object.inspect}"
      end
    end
  end
end

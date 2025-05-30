class RenameAuthStudentsToStudents < ActiveRecord::Migration[7.2]
  def change
    rename_table :auth_students, :students
  end
end

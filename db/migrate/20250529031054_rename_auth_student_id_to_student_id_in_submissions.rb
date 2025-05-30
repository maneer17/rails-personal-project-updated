class RenameAuthStudentIdToStudentIdInSubmissions < ActiveRecord::Migration[7.2]
  def change
    rename_column :submissions, :auth_student_id, :student_id
    rename_column :student_courses, :auth_student_id, :student_id
  end
end

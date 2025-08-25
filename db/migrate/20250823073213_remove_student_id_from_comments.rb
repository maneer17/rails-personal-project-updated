class RemoveStudentIdFromComments < ActiveRecord::Migration[7.2]
  def change
    remove_column :comments, :student_id
  end
end

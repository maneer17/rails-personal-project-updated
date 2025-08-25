class ChangeCommenter < ActiveRecord::Migration[7.2]
  def change
    change_column_null :comments, :commenter_id, false
    change_column_null :comments, :commenter_type, false
  end
end

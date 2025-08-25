class AddCommenterToComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :comments, :commenter, polymorphic: true, null: true
  end
end

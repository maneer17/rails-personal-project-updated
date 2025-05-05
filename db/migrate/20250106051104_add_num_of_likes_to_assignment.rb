class AddNumOfLikesToAssignment < ActiveRecord::Migration[7.2]
  def change
    add_column :assignments, :likes, :integer, default: 1
  end
end

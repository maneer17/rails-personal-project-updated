class CreateUpcomingAssignments < ActiveRecord::Migration[7.2]
  def change
    create_view :upcoming_assignments
  end
end

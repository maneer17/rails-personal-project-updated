class UpdateUpcomingAssignmentsToVersion2 < ActiveRecord::Migration[7.2]
  def change
    replace_view :upcoming_assignments, version: 2, revert_to_version: 1
  end
end

class RenameUniToTenant < ActiveRecord::Migration[7.2]
  def up
    rename_table(:unis, :tenants)
  end

  def down
    undo_rename_table(:unis, :tenants)
  end
end

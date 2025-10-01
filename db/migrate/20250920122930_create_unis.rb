class CreateUnis < ActiveRecord::Migration[7.2]
  def change
    create_table :unis do |t|
      t.string :subdomain

      t.timestamps
    end
  end
end

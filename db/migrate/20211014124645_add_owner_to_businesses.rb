class AddOwnerToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :owner_id, :integer
  end
end

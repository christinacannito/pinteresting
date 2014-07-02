class AddUserIdToFunnies < ActiveRecord::Migration
  def change
    add_column :funnies, :user_id, :integer
    add_index :funnies, :user_id
  end
end

class AlterMemoriesAddUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :user_id, :integer
    add_index :memories, :user_id
  end
end

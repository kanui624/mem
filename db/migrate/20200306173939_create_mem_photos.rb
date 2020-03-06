class CreateMemPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :mem_photos do |t|
      t.text :caption
      t.integer :user_id
      t.integer :memory_id

      t.timestamps
    end

    add_index :mem_photos, [:user_id, :memory_id]
    add_index :mem_photos, :memory_id
  end
end

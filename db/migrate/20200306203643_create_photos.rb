class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.text :caption 
      t.integer :user_id
      t.integer :memory_id
      t.timestamps
    end
    add_index :photos, [:user_id, :memory_id]
    add_index :photos, :memory_id
  end
end

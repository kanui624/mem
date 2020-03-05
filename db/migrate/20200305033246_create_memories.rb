class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|
      
      t.text :title

      t.timestamps
    end
  end
end

class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|

      t.string :title 
      t.string :mood
      t.text   :thoughts
      t.string :location

      t.timestamps
    end
  end
end

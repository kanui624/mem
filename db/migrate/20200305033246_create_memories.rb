class CreateMemories < ActiveRecord::Migration[5.2]
  def change
    create_table :memories do |t|

      t.string :mem_title
      t.string :mood
      t.text   :thoughts
      t.date   :date 
      t.string :location

      t.timestamps
    end
  end
end

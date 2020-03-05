class AlterMemoriesAddLatAndLng < ActiveRecord::Migration[5.2]
  def change
    add_column :memories, :latitude, :float
    add_column :memories, :longitude, :float
  end
end

class AddPictureToMemPhoto < ActiveRecord::Migration[5.2]
  def change
    add_column :mem_photos, :picture, :string
  end
end

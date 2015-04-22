class RemoveImageUrlFromCorrals < ActiveRecord::Migration
  def change
    remove_column :corrals, :image_url, :string
  end
end

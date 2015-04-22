class AddImageUrlToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :image_url, :string
  end
end

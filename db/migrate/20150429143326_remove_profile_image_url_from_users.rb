class RemoveProfileImageUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_image_url, :string
  end
end

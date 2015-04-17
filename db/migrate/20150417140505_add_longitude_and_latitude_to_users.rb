class AddLongitudeAndLatitudeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :float, {:precision=>10, :scale=>6}
    add_column :users, :latitude, :float, {:precision=>10, :scale=>6}
  end
end

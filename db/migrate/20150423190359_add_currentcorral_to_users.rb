class AddCurrentcorralToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_corral_location, :string, default: ""
    add_column :users, :current_corral_latitude, :float, default: 0.0
    add_column :users, :current_corral_longitude, :float, default: 0.0
  end
end

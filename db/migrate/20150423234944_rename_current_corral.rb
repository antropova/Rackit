class RenameCurrentCorral < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.rename :current_corral_location, :current_location
      t.rename :current_corral_latitude, :current_latitude
      t.rename :current_corral_longitude, :current_longitude
    end
  end
end

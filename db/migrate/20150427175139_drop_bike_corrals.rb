class DropBikeCorrals < ActiveRecord::Migration
  def change
    drop_table :bike_corrals
  end
end

class AddLongitudeToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :longitude, :float, {:precision=>10, :scale=>6}
  end
end

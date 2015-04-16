class AddLatitudeToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :latitude, :float, {:precision=>10, :scale=>6}
  end
end

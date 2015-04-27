class AddCrimesToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :crimes, :integer, default: 0
  end
end

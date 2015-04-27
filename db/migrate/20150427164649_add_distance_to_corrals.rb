class AddDistanceToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :distance, :integer, default: 0
  end
end

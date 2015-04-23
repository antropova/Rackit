class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :crimes, :type, :name
  end
end

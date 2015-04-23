class AddBoroughToCrime < ActiveRecord::Migration
  def change
    add_reference :crimes, :borough, index: true
    add_foreign_key :crimes, :boroughs
  end
end

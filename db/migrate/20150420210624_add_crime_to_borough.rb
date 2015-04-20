class AddCrimeToBorough < ActiveRecord::Migration
  def change
    add_reference :boroughs, :crime, index: true
    add_foreign_key :boroughs, :crimes
  end
end

class CreateCrimes < ActiveRecord::Migration
  def change
    create_table :crimes do |t|
      t.float :longitude
      t.float :latitude
      t.string :type

      t.timestamps null: false
    end
  end
end

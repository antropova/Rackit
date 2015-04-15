class CreateBikeCorrals < ActiveRecord::Migration
  def change
    create_table :bike_corrals do |t|
      t.references :bike, index: true
      t.references :corral, index: true

      t.timestamps null: false
    end
    add_foreign_key :bike_corrals, :bikes
    add_foreign_key :bike_corrals, :corrals
  end
end

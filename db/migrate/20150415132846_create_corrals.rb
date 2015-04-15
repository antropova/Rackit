class CreateCorrals < ActiveRecord::Migration
  def change
    create_table :corrals do |t|
      t.string :location
      t.boolean :sheltered, default: false
      t.integer :racks, default: 1
      t.references :borough, index: true

      t.timestamps null: false
    end
    add_foreign_key :corrals, :boroughs
  end
end

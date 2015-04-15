class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :rating
      t.references :bike_corral, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :bike_corrals
  end
end

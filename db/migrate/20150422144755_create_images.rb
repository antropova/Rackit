class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :corral, index: true
      t.string :image_url

      t.timestamps null: false
    end
    add_foreign_key :images, :corrals
  end
end

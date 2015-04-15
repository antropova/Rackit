class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image_url
      t.string :location
      t.text :bio
      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end

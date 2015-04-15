class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :bikes, :users
  end
end

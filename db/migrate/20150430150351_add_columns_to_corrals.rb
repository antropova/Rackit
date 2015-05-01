class AddColumnsToCorrals < ActiveRecord::Migration
  def change
    add_column :corrals, :total_rating, :integer, default: 0
    add_column :corrals, :total_reviews, :integer, default: 0
  end
end

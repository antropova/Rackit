class AddDefaultValueToReviews < ActiveRecord::Migration
  def change
    change_column_default :reviews, :rating, 0
  end
end

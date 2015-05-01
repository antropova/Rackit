class DeleteColumnsFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :corral_id
    remove_column :reviews, :user_id
  end
end

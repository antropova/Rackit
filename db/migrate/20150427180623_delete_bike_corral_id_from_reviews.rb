class DeleteBikeCorralIdFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :bike_corral_id
  end
end

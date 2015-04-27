class AddCorralIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :corral_id, :integer
  end
end

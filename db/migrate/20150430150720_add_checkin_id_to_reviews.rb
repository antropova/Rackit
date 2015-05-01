class AddCheckinIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :checkin_id, :integer
  end
end

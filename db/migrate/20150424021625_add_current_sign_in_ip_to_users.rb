class AddCurrentSignInIpToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_sign_in_ip, :string
  end
end

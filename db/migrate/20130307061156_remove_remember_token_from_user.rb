class RemoveRememberTokenFromUser < ActiveRecord::Migration
  def change
  	remove_column :users, :remember_token
  end
end

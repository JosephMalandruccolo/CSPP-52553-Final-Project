class AddIndexToCities < ActiveRecord::Migration
  def change
  	add_index :cities, :state
  end
end

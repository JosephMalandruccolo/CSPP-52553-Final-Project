class AddSecondIndextoCities < ActiveRecord::Migration
  def change
  	add_index :cities, :city
  end
end

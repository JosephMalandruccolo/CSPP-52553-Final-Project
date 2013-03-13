class AddIndexToPhotosCollegeId < ActiveRecord::Migration
  def change
  	add_index :photos, :college_id
  end
end

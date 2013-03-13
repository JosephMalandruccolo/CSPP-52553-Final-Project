class FixLogoColumnName < ActiveRecord::Migration
  def change
  	rename_column :colleges, :logo, :seal_image_uid
  	add_column :colleges, :seal_image_name, :string 
  end
end

class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo_image_uid
      t.string :photo_image_name
      t.integer :user_id
      t.integer :college_id

      t.timestamps
    end
  end
end

class Photo < ActiveRecord::Base
  attr_accessible :college_id, :photo_image_name, :photo_image_uid, :user_id
end

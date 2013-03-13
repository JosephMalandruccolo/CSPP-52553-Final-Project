class Photo < ActiveRecord::Base
  attr_accessible :college_id, :user_id, :photo_image, :caption

  image_accessor :photo_image

  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :college, :foreign_key => "college_id", :class_name => "College"


  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :college_id, :presence => true
  validates :user_id, :presence => true
  validates :photo_image, :presence => true
  validates_size_of :seal_image, maximum: 300.kilobytes
  validates_property :format, of: :seal_image, :in => [:jpeg, :png, :gif, :jpg]
  validates_property :mime_type, of: :seal_image, :in => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'], case_sensitive: false


end

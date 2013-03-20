class College < ActiveRecord::Base
  attr_accessible :city, :facebook, :instagram, :seal_image, :officialName, :shortName, :state, :twitter, :wikipedia, :website, :retained_seal_image, :remove_seal_image


  image_accessor :seal_image

  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :users, through: :statuses, dependent: :destroy
  has_many :statuses

  has_many :photos


  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :officialName, presence: true
  validates :shortName, :presence => true
  validates :website, presence: true
  validates_size_of :seal_image, maximum: 500.kilobytes
  validates_property :format, of: :seal_image, :in => [:jpeg, :png, :gif, :jpg]
  validates_property :mime_type, of: :seal_image, :in => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'], case_sensitive: false


  ##########################################
  # => METHODS
  ##########################################

  #return all users following this college
  def users_following
    statuses = Status.where(college_id: self.id)
    users = []
    statuses.each do |status|
      users.push(User.find_by_id(status[:user_id]))
    end
    users
  end


end

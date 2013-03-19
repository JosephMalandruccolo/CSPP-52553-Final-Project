class User < ActiveRecord::Base
  attr_accessible :birthMonth, :birthYear, :birthday, :city, :email, :firstName, :gender, :lastName, :password, :password_confirmation, :state, :admin, :hometown, :avatar_image, :retained_avatar_image, :remove_avatar_image

  image_accessor :avatar_image

  has_secure_password


  ##########################################
  # => VIRTUAL ATTRIBUTES
  ##########################################
  def hometown
    "#{self.city}, #{self.state}" if self.city != nil
  end

  def hometown=(cityState)
    hometownArray = cityState.split(',')
    self.city = hometownArray.first
    self.state = hometownArray.last[hometownArray.last.length-2..hometownArray.last.length-1]
  end




  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :colleges, through: :statuses, dependent: :destroy
  has_many :statuses
  has_many :photos


  ##########################################
  # => CALLBACKS
  ##########################################
  # ensures uniqueness of case insensitive emails
  before_save { |user| user.email = email.downcase }


  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :gender, presence: true
  validates :birthMonth, presence: true
  validates :birthday, presence: true
  validates :birthYear, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates_size_of :avatar_image, maximum: 300.kilobytes
  validates_property :format, of: :avatar_image, :in => [:jpeg, :png, :gif, :jpg]
  validates_property :mime_type, of: :avatar_image, :in => ['image/jpg', 'image/jpeg', 'image/png', 'image/gif'], case_sensitive: false
  

  ##########################################
  # => CONSTANTS
  ##########################################
  DEFAULT_RELATIONSHIP = "following"

  ##########################################
  # => METHODS
  ##########################################
  def name
    "#{self.firstName} #{self.lastName}"
  end


  def following?(college)
    statuses.find_by_college_id(college)
  end


  def follow!(college)
    self.statuses.create!(:college_id => college.id, :relationship => DEFAULT_RELATIONSHIP)
  end


  def unfollow!(college)
    self.statuses.find_by_college_id(college).destroy
  end


  def colleges_followed
    College.find_by_id(Status.find_by_user_id(self))
  end

end














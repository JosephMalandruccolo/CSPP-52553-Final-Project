class User < ActiveRecord::Base
  attr_accessible :birthMonth, :birthYear, :birthday, :city, :email, :firstName, :gender, :lastName, :password, :password_confirmation, :state

  has_secure_password


  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :colleges, through: :statuses, dependent: :destroy



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
  

  ##########################################
  # => METHODS
  ##########################################
  def name
    self.firstName + self.lastName
  end



end

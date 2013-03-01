class User < ActiveRecord::Base
  attr_accessible :birthMonth, :birthYear, :birthday, :city, :email, :firstName, :gender, :lastName, :password_digest, :state

  ##########################################
  # => CALLBACKS
  ##########################################
  # ensures uniqueness of case insensitive emails
  before_save { |user| user.email = email.downcase }

  ##########################################
  # => VALIDATIONS
  ##########################################
  # form is complete
  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :gender, presence: true
  validates :birthMonth, presence: true
  validates :birthday, presence: true
  validates :birthYear, presence: true
  validates :city, presence: true
  validates :state, presence: true

  # form is correct
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }






end

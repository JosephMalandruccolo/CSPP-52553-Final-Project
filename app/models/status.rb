class Status < ActiveRecord::Base
  attr_accessible :college_id, :relationship, :user_id


  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  belongs_to :user
  belongs_to :college



  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :user_id, presence: true
  validates :college_id, presence: true
  validates :relationship, presence: true


end

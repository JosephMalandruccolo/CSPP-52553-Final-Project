class Status < ActiveRecord::Base
  attr_accessible :college_id, :relationship, :user_id


  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  belongs_to :user, :foreign_key => "user_id", :class_name => "User"
  belongs_to :college, :foreign_key => "college_id", :class_name => "College"



  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :user_id, presence: true
  validates :college_id, presence: true
  validates :relationship, presence: true
  validates_uniqueness_of :user_id, scope: :college_id

end

class Comment < ActiveRecord::Base
  attr_accessible :college_id, :text, :user_id, :commentable_type, :commentable_id

  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  belongs_to :commentable, polymorphic: true



  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :commentable_type, :inclusion => { :in => %w(Photo) }
  validates :college_id, presence: true
  validates :user_id, presence: true

end

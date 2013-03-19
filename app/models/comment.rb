class Comment < ActiveRecord::Base
  attr_accessible :college_id, :text, :user_id

  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  belongs_to :commentable, polymorphic: true






end

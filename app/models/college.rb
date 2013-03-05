class College < ActiveRecord::Base
  attr_accessible :city, :facebook, :instagram, :logo, :officialName, :shortName, :state, :twitter, :wikipedia, :website


  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :users, through: :statuses, dependent: :destroy





  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :officialName, presence: true
  validates :shortName, :presence => true
  validates :logo, :presence => true
  validates :website, presence: true


end

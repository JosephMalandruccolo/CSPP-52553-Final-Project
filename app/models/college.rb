class College < ActiveRecord::Base
  attr_accessible :city, :facebook, :instagram, :logo, :officialName, :shortName, :state, :twitter, :wikipedia


  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :city, presence: true


end

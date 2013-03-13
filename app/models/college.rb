class College < ActiveRecord::Base
  attr_accessible :city, :facebook, :instagram, :seal_image, :officialName, :shortName, :state, :twitter, :wikipedia, :website


  image_accessor :seal_image

  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :users, through: :statuses, dependent: :destroy
  has_many :statuses


  ##########################################
  # => LOGO (SEAL)
  ##########################################
  





  ##########################################
  # => VALIDATIONS
  ##########################################
  validates :city, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :officialName, presence: true
  validates :shortName, :presence => true
  validates :website, presence: true


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

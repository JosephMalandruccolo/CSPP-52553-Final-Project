class College < ActiveRecord::Base
  attr_accessible :city, :facebook, :instagram, :logo, :officialName, :shortName, :state, :twitter, :wikipedia, :website


  ##########################################
  # => RELATIONAL MODEL
  ##########################################
  has_many :users, through: :statuses, dependent: :destroy
  has_many :statuses





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

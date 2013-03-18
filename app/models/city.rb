class City < ActiveRecord::Base
  attr_accessible :city, :country, :state, :latitude, :longitude

  validates_presence_of :city
  validates_presence_of :country
  validates_presence_of :state


  def self.import(file)
  	CSV.foreach(file.path, headers: true) do |row|
  		City.create! row.to_hash
  	end
  end

end

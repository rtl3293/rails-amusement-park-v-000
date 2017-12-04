class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." if (attraction.tickets > user.tickets && attraction.min_height > user.height)
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}." if attraction.tickets > user.tickets
    return "Sorry. You are not tall enough to ride the #{attraction.name}." if attraction.min_height > user.height
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end

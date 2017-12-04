class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    # binding.pry
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}." if (!enough_tickets && !tall_enough)
    return "Sorry. You do not have enough tickets to ride the #{attraction.name}." if !enough_tickets
    return "Sorry. You are not tall enough to ride the #{attraction.name}." if !tall_enough
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end

  def tall_enough
    user.height > attraction.min_height
  end

  def enough_tickets
    user.tickets > attraction.tickets
  end
end

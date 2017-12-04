class RidesController < ApplicationController

  def create
    # binding.pry
    # binding.pry
    @ride = Ride.create(user_id: ride_params[:user_id], attraction_id: ride_params[:attraction_id])
    if !@ride.take_ride.is_a? String
      flash[:notice] = "Thanks for riding the #{@ride.attraction.name}!"
    elsif
      flash[:notice] = @ride.take_ride
    end
    redirect_to user_path(current_user)
  end

  def ride_params
    params.require(:ride)
  end
end

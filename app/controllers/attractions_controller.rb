class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update]
  def index
    @attractions = Attraction.all
  end

  def show

  end

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end
end

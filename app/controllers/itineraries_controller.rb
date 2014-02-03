class ItinerariesController < ApplicationController

  def new
    @itinerary = Itinerary.new
    2.times { @itinerary.locations.build}
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to @itinerary
    else
      render action: 'new'
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @start = @itinerary.locations.first
    @end = @itinerary.locations.last

    # calculate map center from 2 points
    lats = [@start.latitude, @end.latitude]
    longs = [@start.longitude, @end.longitude]

    @center = Location.new
    @center.latitude = ((lats.max - lats.min) / 2 ) + lats.min
    @center.longitude = ((longs.max - longs.min) / 2 ) + longs.min
  end

  private
    def itinerary_params
      params.require(:itinerary).permit( locations_attributes: [:id, :address])
    end
end

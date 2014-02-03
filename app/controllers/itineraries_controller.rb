class ItinerariesController < ApplicationController

  def new
    @itinerary = Itinerary.new
    2.times { @itinerary.locations.build }
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      redirect_to @itinerary
    else
      render action: 'new'
    end
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
    redirect_to @itinerary
  end

  def show
    @itinerary = Itinerary.find(params[:id])

    # fill bounds: http://leafletjs.com/reference.html#latlngbounds
    @bounds = @itinerary.locations.map{ |l| [l.latitude, l.longitude] }
  end

  private
    def itinerary_params
      params.require(:itinerary).permit( locations_attributes: [:id, :address])
    end
end

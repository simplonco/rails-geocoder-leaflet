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
    new_locations = 
      itinerary_params[:locations_attributes].map{ |l| l[1] }

    new_locations.each do |nl|
      loc = Location.find nl[:id]
      loc.address = nl[:address]
      loc.save
    end
    
    @itinerary = Itinerary.find(params[:id])
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

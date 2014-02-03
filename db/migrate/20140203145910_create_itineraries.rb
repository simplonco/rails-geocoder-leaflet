class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.timestamps
    end
    add_reference :locations, :itinerary, index: true
  end
end

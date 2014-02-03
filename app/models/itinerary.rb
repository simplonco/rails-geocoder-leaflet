class Itinerary < ActiveRecord::Base
  has_many :locations
  accepts_nested_attributes_for :locations
end

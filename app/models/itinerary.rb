class Itinerary < ActiveRecord::Base
  has_many :locations
  
  # necessary for nested forms
  accepts_nested_attributes_for :locations 
end

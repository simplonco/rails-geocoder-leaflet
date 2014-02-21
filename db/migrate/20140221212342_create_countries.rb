class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_code
      t.string :capital
      t.integer :surface_area
      t.string :geo_zone
      t.integer :pop_count
      t.integer :pop_density

      t.timestamps
    end
  end
end

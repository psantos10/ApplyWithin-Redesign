class AddRegiontoLondonAreas < ActiveRecord::Migration
  def change
    add_column :london_areas, :region, :string
  end
end

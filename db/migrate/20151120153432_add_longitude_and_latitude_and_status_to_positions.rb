class AddLongitudeAndLatitudeAndStatusToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :longitude, :float
    add_column :positions, :latitude, :float
    add_column :positions, :status, :string
    add_column :positions, :business_type, :string
  end
end

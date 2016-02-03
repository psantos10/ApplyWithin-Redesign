class AddColumnsToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :address, :string
    add_column :searches, :postcode, :string
    add_column :searches, :city, :string
    add_column :searches, :latitude, :float
    add_column :searches, :longitude, :float
  end
end

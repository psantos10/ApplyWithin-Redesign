class AddPostcodeToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :postcode, :string
  end
end

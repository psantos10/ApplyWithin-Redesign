class AddAreaAndBracketNameToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :area, :string
    add_column :positions, :bracket_name, :string
    add_column :positions, :category_name, :string
  end
end

class AddFormtoPositions < ActiveRecord::Migration
  def change
    add_column :positions, :form, :string
  end
end

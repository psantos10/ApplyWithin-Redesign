class AddSourceToHunters < ActiveRecord::Migration
  def change
    add_column :hunters, :source, :string
    add_column :businesses, :source, :string
  end

end

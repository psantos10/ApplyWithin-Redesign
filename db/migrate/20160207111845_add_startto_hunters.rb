class AddStarttoHunters < ActiveRecord::Migration
  def change
    add_column :hunters, :start_date, :string
  end
end

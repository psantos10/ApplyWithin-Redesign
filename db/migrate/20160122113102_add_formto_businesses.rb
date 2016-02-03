class AddFormtoBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :form, :string
  end
end

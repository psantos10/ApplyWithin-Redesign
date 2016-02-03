class AddFormtoHunters < ActiveRecord::Migration
  def change
    add_column :hunters, :form, :string
  end
end

class SaveAllBusinessesSoTheyHaveHours < ActiveRecord::Migration
  def change
    Business.find_each.map(&:save)
  end
end

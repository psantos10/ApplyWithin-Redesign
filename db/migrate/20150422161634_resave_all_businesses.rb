class ResaveAllBusinesses < ActiveRecord::Migration
  def change
    Business.all.each(&:save)
  end
end

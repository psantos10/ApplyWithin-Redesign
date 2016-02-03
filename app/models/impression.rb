class Impression < ActiveRecord::Base
  belongs_to :user
  belongs_to :trackable, polymorphic: true

  def self.record(trackable, current_user)
    trackable.impressions.create(user: current_user)
  end

end
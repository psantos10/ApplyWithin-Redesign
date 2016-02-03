class AvailableTime < ActiveRecord::Base
  belongs_to :hunter

  after_create :set_default

  default_scope -> {
    order(:id)
  }

  def self.days
    %i[mon tue wed thu fri sat sun]
  end

  def set_default
  end

  # virtual attributes to auto format the return
  # via define_method and an enum!
  %i[morning afternoon evening late].each do |meth|
    define_method meth do
      return true if read_attribute(meth).blank?
      read_attribute(meth)
    end
  end
end

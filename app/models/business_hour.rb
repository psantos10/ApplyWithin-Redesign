class BusinessHour < ActiveRecord::Base
  belongs_to :business

  default_scope -> {
    order(:id)
  }

  def self.days
    %i[mon tue wed thu fri sat sun]
  end

  # virtual attributes to auto format the return
  # via define_method and an enum!
  %i[opens_at closes_at].each do |meth|
    define_method meth do
      return Time.new if read_attribute(meth).blank?
      read_attribute(meth)
    end
  end
end

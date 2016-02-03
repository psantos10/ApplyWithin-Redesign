class Gallery < ActiveRecord::Base
  belongs_to :business
  has_many :photos

end

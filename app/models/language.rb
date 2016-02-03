class Language < ActiveRecord::Base
  belongs_to :hunter
  delegate :user, to: :hunter

  validates :name, :level, :presence => true

end

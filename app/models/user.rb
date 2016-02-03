class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable,  :validatable

  delegate :display_name, to: :group
  
  has_one :hunter
  has_one :business

  include Groups

  def admin_for?(resource)
    return false if resource.blank?
    resource.user == self
  end

  def has_applied?(position_advertisement)
    group.has_applied?(position_advertisement)
  end

end
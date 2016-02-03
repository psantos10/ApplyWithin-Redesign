class PositionAdvertisement < ActiveRecord::Base
  include AutoApplicationsHelper
  acts_as_paranoid

  belongs_to :position

  has_many :applicants, source: :hunter, through: :applications
  has_many :active_applications, -> { active }, class_name: "PositionApplication"
  has_many :applications, class_name: "PositionApplication", dependent: :destroy

  delegate :title, :business, :category, :bracket, to: :position
  delegate :open, to: :position

  after_create :auto_application

  scope :open, -> { 
    where("closed_at >= ? OR closed_at IS NULL", DateTime.now) 
  }

  scope :closed, -> {
    !open
  }

  def self.active
    open.first
  end

  def new_applicants
    applications.unseen
  end

  def open?
    !closed?
  end

  def closed?
    !closed_at.nil? && closed_at <= DateTime.now
  end

  def position_title
    position.present? ? position.title : ''
  end

  def active_applicant_count
    active_applications.map(&:hunter).count
  end

  def new_applications
    new_applications = active_applications.to_a.select { |app| Impression.where(trackable: app).none?}  
    new_applications.count
  end

  def auto_application
    check_auto_applications(self)
  end

end

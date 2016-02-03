class PositionApplication < ActiveRecord::Base
  acts_as_paranoid
  include PositionApplicationsHelper
    
  belongs_to :hunter
  belongs_to :advertisement, foreign_key: 'position_advertisement_id', class_name: 'PositionAdvertisement'
  has_many :impressions, as: :trackable

  delegate :name, :postcode, :business_type, to: :business

  delegate :title, :business, :start_date, :tagline, :wage, :status, to: :advertisement
  delegate :position, :applicants, to: :advertisement

  scope :active, -> {
    where("rejected_at IS NULL AND \ cancelled_at IS NULL")
  }

  scope :rejected, -> {
    where("rejected_at IS NOT NULL")
  }

  scope :unseen, -> {
    joins("left join impressions ON \
           impressions.trackable_type='PositionApplication' \
           AND impressions.trackable_id = position_applications.id")
  }

  scope :for_position, ->(position) {
    position.applications
  }

  def active?
    rejected_at.nil? && cancelled_at.nil?
  end

  def rejected? 
    !active?
  end

  def current_applicant_id(applications, current_id=Hunter.first)
    hunter_ids = applications.flat_map(&:hunter).map(&:id)
    raise hunter_ids.inspect
    hunter_ids.index(current_id)
  end

  def new_applicant
    if Impression.where(trackable: self).none?
      true
    else
      false
    end
  end

end
class Position < ActiveRecord::Base
  # include ::SoftDestroy
  include AutoApplicationsHelper
  acts_as_paranoid

  include PgSearch
  
  multisearchable against: %i[title category weekly_hours postcode business_type name area bracket_name category_name]

  belongs_to :business

  validates :title, :bracket, :category, :presence => true, :if => lambda { |b| b.form == "info"}
  validates :tagline, length: { minimum: 20, maximum: 200}, :presence => true, :if => lambda { |b| b.form == "info"}
  validates :description, length: { minimum: 20, maximum: 1000}, :presence => true, :if => lambda { |b| b.form == "info"}
  validates :openings, :start_date, :wage, :weekly_hours, :age_restricted, :customer_facing, :dress_code, :tips, :presence => true, :if => lambda { |b| b.form == "detail"}
  validates :roles_and_responsibilities, :desired_sqa, length: { minimum: 20, maximum: 1000}, :presence => true, :if => lambda { |b| b.form == "about" }

  after_create :set_postcode, :set_area, :set_bracket_name, :set_category_name, :set_business_type
  after_create :create_advertisement
  has_many :advertisements, dependent: :destroy,
           class_name: 'PositionAdvertisement'


  has_many :applicants, through: :advertisements, dependent: :destroy
  has_many :applications, through: :advertisements, dependent: :destroy
  has_many :impressions, :through => :advertisements, :source => 'PositionAdvertisements'

  delegate :name, to: :business
  reverse_geocoded_by :latitude, :longitude

  scope :status, -> (status) { where status: "available" }

  scope :waiting, -> (waiting) { where bracket: "Waiting staff" }
  scope :bar, -> (bar) { where bracket: "Bar staff" }
  scope :barista, -> (barista) { where bracket: "Barista" }
  scope :shop, -> (shop) { where bracket: "Shop staff" }
  scope :kitchen, -> (kitchen) { where bracket: "Kitchen staff" }


  def current_advertisement
    advertisements.order("created_at").last
  end

  def is_this_job_open
    if current_advertisement.present?
      current_advertisement.open?
    else 
      false
    end
  end

  def available_jobs_only
    current_advertisement.present? && current_advertisement.open? == true
  end

  def current_applicants
    return [] if current_advertisement.nil?
    current_advertisement.applications.active.map(&:hunter)
  end

  def current_applications
    return [] if current_advertisement.nil?
    current_advertisement.applications
  end

  def type
    JobBracket.find(self.bracket).name
  end

  def set_postcode
    self.update_attribute(:postcode, "#{self.business.postcode[/(\S+)/, 1]}")
  end

  def set_area
    self.update_attribute(:area, "#{LondonArea.find_by(postcode: self.postcode).name}")
  end

  def set_bracket_name
    self.update_attribute(:bracket_name, "#{JobBracket.find(self.bracket).name}")
  end

  def set_category_name
    self.update_attribute(:category_name, "#{JobCategory.find(self.category).name}")
  end

  def set_business_type
    self.update_attribute(:business_type, "#{BusinessType.find(self.business_type).name}")
  end

  def name
    business.name
  end

  private 

  def create_advertisement
    self.advertisements.build.save
    self.update_attribute(:status, "available")
  end

end
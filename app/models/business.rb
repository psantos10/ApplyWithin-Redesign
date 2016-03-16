class Business < ActiveRecord::Base
  include PgSearch
  multisearchable against: %i[name business_type address postcode city about]

  belongs_to :user
  belongs_to :owner, class_name: "User", foreign_key: :user_id

  validates :user, :presence => true
  validates :name, :postcode, :business_type, :presence => true, :if => lambda { |b| b.form == "info" } && lambda { |b| b.form == "job" } && lambda { |b| b.form == "all" }
  validates :tagline, length: { minimum: 10, maximum: 200 }, :presence => true, :if => lambda { |b| b.form == "info" } && lambda { |b| b.form == "job" } && lambda { |b| b.form == "all" }
  validates :cover_image, :presence => true, :if => lambda { |b| b.form == "info" } && lambda { |b| b.form == "job" } && lambda { |b| b.form == "all" }
  validates :address, :city, :phone, :website, :presence => true, :if => lambda { |b| b.form == "contact" } && lambda { |b| b.form == "all" }
  validates :name, :postcode, :business_type, :presence => true, :if => lambda { |b| b.form == "about" } && lambda { |b| b.form == "all" }

  has_many :positions, dependent: :destroy
  has_many :position_advertisements, through: :positions, source: :advertisements
  has_many :hours, class_name: 'BusinessHour', dependent: :destroy

  after_create :ensure_business_hours
  after_create :ensure_default_gallery
  after_create :check_user

  after_validation :geocode
  geocoded_by :postcode

  has_attached_file :cover_image,
      styles: {
        :tiny  => "75x75#",
        :small  => "150x150#",
        :medium => "200x200#",
        :large => "400x400#"},
        :bucket => 'redesignapplywithin',
      convert_options: {
        all: "-strip -interlace Plane -sampling-factor 4:2:0 -quality 87%"
        # Override default convert options
      }

  validates_attachment :cover_image,
    content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  has_many :galleries, dependent: :destroy

  accepts_nested_attributes_for :hours

  delegate :email, to: :user
  
  scope :location, -> (location) { where("postcode ILIKE ?", "#{location}%")}
  scope :business_type, -> (business_type) { where business_type: business_type }

  def check_user
    if self.user_id == nil
      self.destroy
    end
  end

  def cover_image_profile
    if cover_image.present? 
      cover_image
    else
      ActionController::Base.helpers.asset_path("wall.jpg")
    end  
  end

  def default_gallery
    galleries.first
  end

  def default_photo
    default_gallery.photos.first
  end


  def current_advertisements_with_applications
    position_advertisements.select {|pa| pa.active_applications.any? && pa.open? }
  end

  def display_name
    name
  end

  def owner?(user)
    owner == user
  end

  def self.search(query)
    if query.present?
      search_by_name(query)
    else
      # No query? Return all records, newest first.
      order("created_at DESC")
    end
  end

  def type
    BusinessType.find(self.business_type).name
  end

private

  def ensure_business_hours
    return if hours.count == 7
    # written so if there is a bug where there is only
    # 5 or 6 days it wont recreate all 7 just the missing
    # ones.
    BusinessHour.days.each do |day|
      hours.find_or_create_by(day: day)
    end
  end

  def ensure_default_gallery
    galleries.create if galleries.none?
  end

end

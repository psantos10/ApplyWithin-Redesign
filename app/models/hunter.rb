class Hunter < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, :phone, :location, :seeking, :driving_licence, :avatar, presence: true, :if => lambda { |b| b.form == "profile" }
  validates :tagline, length: { minimum: 10, maximum: 200 }, :presence => true, :if => lambda { |b| b.form == "profile" }
  validates :summary, :interests, length: { minimum: 50, maximum: 800 }, :presence => true, :if => lambda { |b| b.form == "about" }

  has_many :experiences, -> { order('end_date DESC') }, dependent: :destroy
  has_many :educations, -> { order('end_date DESC') }, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :applications, class_name: "PositionApplication"
  has_many :auto_applications
  has_many :available_times, class_name: 'AvailableTime', dependent: :destroy

  after_create :ensure_available_times
  after_create :check_user

  accepts_nested_attributes_for :available_times

  has_attached_file :avatar,
      styles: {
        :small  => "150x150#",
        :medium => "200x200#"},
        :bucket => 'redesignapplywithin',
      convert_options: {
        all: "-strip -interlace Plane -sampling-factor 4:2:0 -quality 87%"
        # Override default convert options
      }

      has_attached_file :cover_photo,
          styles: {
            :cover  => "1000x400#",
            :medium => "200x200#"},
            :bucket => 'redesignapplywithin',
          convert_options: {
            all: "-strip -interlace Plane -sampling-factor 4:2:0 -quality 87%"
            # Override default convert options
          }

  validates_attachment :avatar,
    content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  validates_attachment :cover_photo,
    content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

  delegate :email, to: :user

  def check_user
    if self.user_id == nil
      self.destroy
    end
  end

  def current_applications
    applications.select {|app| app.active? && app.advertisement.open? }
  end

  def past_applications
    applications.select {|app| !app.active? || app.advertisement.closed? }
  end

  def self.find_by_email(email)
    user = User.find_by_email(email)
    user.group.is_a?(Hunter) ? user.group : nil
  end

  def has_applied?(advertisement)
    applications.where(position_advertisement_id: advertisement.id).any?
  end

  def cover_image
    if cover_photo.present? 
      cover_photo
    else
      
    end  

  end

  def display_name
    "#{first_name} #{last_name}"
  end

  def application_for(advertisement)
    advertisement.applications.select {|app| app.hunter == self }.first
  end

private

  def ensure_available_times
    return if available_times.count == 7
    AvailableTime.days.each do |day|
      available_times.find_or_create_by(day: day)
    end
  end

end

# validates :nationality, presence: true
# validates :summary, presence: true, length: { maximum: 500 }
# validates :interests, presence: true, length: { maximum: 500 }
# validates :teamwork, presence: true, length: { maximum: 500 }
# validates :communication, presence: true, length: { maximum: 500 }
# validates :customer_service, presence: true, length: { maximum: 500 }
# validates :responsibility, presence: true, length: { maximum: 500 }
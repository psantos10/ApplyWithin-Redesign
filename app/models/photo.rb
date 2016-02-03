class Photo < ActiveRecord::Base
  belongs_to :gallery

  has_attached_file :file,
      styles: {
        :thumb => "100x100#",
        :small  => "150x150#",
        :medium => "200x200#",
        :large => "420x420#"},
        :bucket => 'redesignapplywithin',
        default_url: "/images/:style/missing.png",
      convert_options: {
        all: "-strip -interlace Plane -sampling-factor 4:2:0 -quality 87%"
        # Override default convert options
      }

  validates_attachment :file,
    presence: true, 
    content_type: { 
    content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  }

end
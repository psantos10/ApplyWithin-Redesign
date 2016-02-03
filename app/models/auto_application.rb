class AutoApplication < ActiveRecord::Base
  include AutoApplicationsHelper

  belongs_to :hunter

  scope :job_type, -> (job_type) { where job_type: job_type }
  scope :location, -> (location) { where location: location }

  after_create :auto_application_2
  
  def auto_application_2
    check_existing_jobs(self)
  end

end

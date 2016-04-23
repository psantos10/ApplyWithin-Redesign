module AutoApplicationsHelper

  def check_auto_applications(resource)
    params1 = ActionController::Parameters.new(resource.position.bracket)
    params2 = ActionController::Parameters.new(resource.position.rank)

    @auto_applications = AutoApplication.all.job_type(params1[:job_type]) if params1[:job_type].present?
    @auto_applications = @auto_applications.location(params2[:location]) if params2[:location].present?
    @auto_applications.find_each do |aa|
      resource.applicants << Hunter.find_by_user_id(aa.hunter.user_id)
    end
  end

  def check_existing_jobs(resource)
    @positions = Position.all.where(status: 'available')
    @positions = @positions.where(bracket: "#{resource.job_type}").where(rank: "#{resource.location}")
    @positions.find_each do |p|
      if p.current_advertisement.applicants.include?(hunter)
        nil
      else
        p.current_advertisement.applicants << Hunter.find_by_user_id(hunter.user_id) 
      end 
    end
  end

end



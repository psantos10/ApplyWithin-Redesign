class PositionApplicationsController < ApplicationController
  include AutoApplicationsHelper

  def index
    position_applications
  end

  def create
    if current_user.group.is_a?(Business)
      redirect_to :back, notice: "Sorry, you're a business user and can't apply for jobs"
    else position_advertisement.applicants << Hunter.find_by_user_id(current_user)
      redirect_to :back, notice: "You've applied to the position, check your current applications"
    end
  end

  def show
    position_advertisement
  end

  def destroy
    position_application.destroy
  end

  def reject_application
    application.update_attribute(:rejected_at, DateTime.now)
    redirect_to position_advertisement_position_applications_path(position_advertisement), notice: "Applicant rejected"
  end

  def cancel_application
    application.update_attribute(:cancelled_at, DateTime.now)
    redirect_to :dashboard, notice: "Application cancelled"
  end

private

  def position_advertisement
    @position_advertisement ||= if nested?
      PositionAdvertisement.find(params[:position_advertisement_id])
    else
      position_application.advertisement
    end
  end

  def position_application
    @position_application ||= if nested?
      position_advertisement.applications.find(params[:id])
    else
      PositionApplication.find(params[:id])
    end
  end

  def position_applications
    @position_applications = position_advertisement.applications.active
  end

  def application
    application = PositionApplication.find(params[:id])
  end

  def nested?
    params.keys.include?('position_advertisement_id')
  end

end

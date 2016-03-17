class PositionApplicationsController < ApplicationController
  include AutoApplicationsHelper

  def index
    position_applications
  end

  def create
    if current_user.group.is_a?(Business)
      respond_to do |format|
        flash[:warning] = "Sorry, you're a business user and can't apply for jobs."
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: :back }
      end
    else 
      hunter_apply
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

  def hunter_apply
    respond_to do |format|
      if hunter.first_name.blank?
        flash[:danger] = 'You need to complete your profile.'
        format.html { redirect_to hunter }
        format.json { render :show, status: :created, location: hunter }
      else
        position_advertisement.applicants << hunter
        format.html { redirect_to hunter }
        format.json { render :show, status: :created, location: hunter }
      end
    end

  end

  def hunter
    @hunter = Hunter.find_by_user_id(current_user)
  end

end
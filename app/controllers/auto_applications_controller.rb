class AutoApplicationsController < ApplicationController
  include PositionsHelper
  include AutoApplicationsHelper

  skip_before_action :authenticate_user!, only: %i[index]

  before_action :hunter, only: %i[new create show]
  before_action :auto_application, only: %i[update edit destroy]

  def index
    @auto_applications = AutoApplication.all

    @auto_applications = @auto_applications.job_type(params[:job_type]) if params[:job_type].present?
    @auto_applications = @auto_applications.location(params[:location]) if params[:location].present?
  end

  def show
    auto_application
  end

  def new
    new_auto_application
  end

  def edit
    auto_application
  end

  def create
    if new_auto_application(auto_application_params).save
      redirect_to :dashboard, notice: "AutoApplication Added"
    else
      render 'new',  notice: "Sorry, that didn't work"
    end
  end

  def update
    if auto_application.update_attributes(auto_application_params)
      redirect_to :dashboard, notice: "AutoApplication Updated"
    else
      render 'edit', notice: "Sorry, that didn't work"
    end
  end

  def destroy
    hunter = auto_application.hunter
    auto_application.destroy
    redirect_to :dashboard, notice: "AutoApplication Deleted"
  end

private

  def new_auto_application(vals={})
    @auto_application ||= hunter.auto_applications.build(vals)
  end

  def auto_application
    @auto_application ||= AutoApplication.find(params[:id])
  end

  def auto_applications
    @auto_applications ||= hunter.auto_application.find(params[:id])
  end

  def hunter
    @hunter ||= Hunter.find(params[:hunter_id])
  end

  def auto_application_params
    params.require(:auto_application).permit(:location, :job_type, :status, :action)
  end

end


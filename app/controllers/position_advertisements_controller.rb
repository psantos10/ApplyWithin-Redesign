class PositionAdvertisementsController < ApplicationController
  include AutoApplicationsHelper

  def new
    new_position_advertisement
  end

  def show
    position_advertisement
  end

  def create
    if new_position_advertisement.save
      position_advertisement.position.update_attribute(:status, "available")
      redirect_to :dashboard, notice: "Job is now open"
    else
      redirect_to :dashboard, notice: "Sorry that didn't work"
    end
  end

  def update
    if position_advertisement.update(position_advertisement_params)
      position_advertisement.position.update_attribute(:status, "unavailable")
      redirect_to :dashboard, notice: "Job is now closed"
    else
      redirect_to :back, notice: "Sorry that didn't work"
    end
  end

  def destroy
    position_advertisement.destroy
  end

private

  def new_position_advertisement
    @position_advertisement ||= position.advertisements.build
  end

  def position
    @position ||= Position.find(params[:position_id]) if params.include?(:position_id)
  end

  def position_advertisement
    @position_advertisement ||= if position.present?
      position.advertisements.find(params[:id])
    else
      PositionAdvertisement.find(params[:id])
    end
  end

  def position_advertisement_params
    params.require(:position_advertisement).permit(:position_id, :end_date, :closed_at, :deleted_at)
  end

end

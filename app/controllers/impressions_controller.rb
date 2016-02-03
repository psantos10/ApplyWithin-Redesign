class ImpressionsController < ApplicationController
  respond_to :json

  def create
    new_impression.save
    head :ok
  end

private

  def new_impression
    @impression = Impression.record(trackable, current_user)
  end

  def trackable
    @trackable ||= impression_params[:trackable_type].
                    constantize.find(impression_params[:trackable_id])
  end

  def impression_params
    params[:impression]
  end
end

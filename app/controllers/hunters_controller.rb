class HuntersController < ApplicationController
  before_action :set_hunter, only: [:show, :edit, :update, :destroy]
  before_action :protect_resource, only: %i[edit update show destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  respond_to :html

  def index
    @hunters = Hunter.all
    respond_with(@hunters)
  end

  def show
    if @hunter.first_name.present?
      @hunter
    else
      redirect_to edit_profile_hunter_path(@hunter)
    end
  end

  def new
    @hunter = Hunter.new
    respond_with(@hunter)
    respond_with edit_hunter_path(@hunter)
  end

  def edit
  end

  def edit_profile
    set_hunter
  end

  def edit_times
    set_hunter
  end

  def edit_cover_photo
    set_hunter
  end

  def edit_about
    set_hunter
  end

  def create
    @hunter = Hunter.new(hunter_params)
    respond_to do |format|
      if @hunter.save
        flash[:success] = 'Your profile was successfully created.'
        format.html { redirect_to @hunter }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem creating your profile.'
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update 
    respond_to do |format|
      if @hunter.update(hunter_params)
        flash[:success] = 'Your profile was successfully updated.'
        format.html { redirect_to @hunter }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem updating your profile.'
        format.html { render "edit_#{@hunter.form}" }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_profile
    set_hunter
  end

  def update_times
    set_hunter
  end

  def update_cover_photo
    set_hunter
  end

  def update_about
    set_hunter
  end

  def destroy
    @hunter.destroy
    respond_to do |format|
      flash[:success] = 'Your profile was successfully deleted, now piss off.'
      format.html { redirect_to :root }
      format.json { head :no_content }
    end
  end

private

  def set_hunter
    @hunter = Hunter.find(params[:id])
  end

  def hunter_params
    params.require(:hunter).permit(:first_name, :last_name, :dob, :nationality, :location, :phone, :email, 
                                    :seeking, :driving_licence, :tagline, :avatar, :cover_photo, :summary, :interests, :teamwork, 
                                    :communication, :customer_service, :responsibility, :form, :start_date, available_times_attributes: [
                                       :id, :morning, :afternoon, :evening, :late
                                     ])
  end

  def protect_resource
    if @hunter.user != current_user
      redirect_to :root, notice: 'You do not have access to that page or resource!'
    end
  end
end

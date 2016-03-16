class BusinessesController < ApplicationController

  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :protect_resource, only: %i[edit update destroy]

  respond_to :html, :json

  def index
    @businesses = Business.all

    if PgSearch.multisearch(params["q"]).present?
      @businesses = PgSearch.multisearch(params["q"])
      @businesses = Business.where(id: @businesses.map(&:searchable).map(&:id))
    end

    @businesses = @businesses.near(params[:location], params[:miles]) if params[:location].present?
    @businesses = @businesses.order('updated_at DESC').paginate(:page => params[:page], :per_page => 48)

		@hash = Gmaps4rails.build_markers(@businesses) do |business, marker|
		  marker.lat business.latitude
		  marker.lng business.longitude
		  marker.infowindow render_to_string(:partial => "/businesses/map_marker", :locals => { :business => business}) 
		  marker.json({ title: business.name })
		end

    prepare_meta_tags title: "Businesses", description: "Check out all these great businesses using ApplyWithin"
  end

  def show
    prepare_meta_tags(title: @business.name,
                      description: @business.tagline,
                      image: @business.cover_image_profile
                      )

    if @business.name.present?
      @business
    else
      redirect_to edit_business_path(@business)
    end
  end

  def new
    @business = Business.new
  end

  def edit
  end

  def edit_job
    set_business
  end

  def edit_info
    set_business
  end

  def edit_contact
    set_business
  end

  def edit_about
    set_business
  end

  def edit_hours
    set_business
  end

  def create 
    @business = Business.new(business_params)
    @business.save
    respond_to do |format|
      if @business.save
        flash[:success] = 'Business was successfully created.'
        format.html { redirect_to @business }
        format.json { render :show, status: :created, location: @business }
      else
        flash[:danger] = 'There was a problem creating the Business.'
        format.html { render :new }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @business.update(business_params)
        if @business.form == "job"
          flash[:success] = 'Your profile is ready now add your job.'
          format.html { redirect_to new_business_position_path(@business) }
        else
          flash[:success] = 'Business was successfully updated.'
          format.html { redirect_to @business }
          format.json { render :show, status: :created, location: @business }
        end
      else
        flash[:danger] = 'There was a problem updating the Business.'
        format.html { render "edit_#{@business.form}" }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_job
    set_business
  end

  def update_info
    set_business
  end

  def update_contact
    set_business
  end

  def update_about
    set_business
  end

  def update_hours
    set_business
  end

  def destroy
    @business.destroy
    respond_to do |format|
      flash[:success] = 'Business was successfully destroyed.'
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end

private

  def set_business
    @business = Business.find(params[:id])
  end

  def business_params
    params.require(:business).permit(:name, :business_type, :address,
                                     :postcode, :city, :phone, :website,
                                     :about, :longitude, :latitude, :facebook, :google_plus,
                                     :instagram, :twitter, :tagline, :cover_image, :form, hours_attributes: [
                                       :id, :opens_at, :closes_at
                                     ])
  end

  def protect_resource
    if !@business.owner?(current_user)
      redirect_to :root, notice: 'You do not have permission to view that page or resource.'
    end
  end

  def searched?
    params.keys.include?("search")
  end

end
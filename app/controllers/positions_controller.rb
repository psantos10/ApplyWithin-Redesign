class PositionsController < ApplicationController
  include PositionsHelper
  include AutoApplicationsHelper
  
  skip_before_action :authenticate_user!, only: %i[index show]

  before_action :business, only: %i[new create]
  before_action :position, only: %i[update edit destroy]

  def index
    @positions = Position.all.where(status: "available")

    @positions = @positions.waiting(params[:waiting]) if params[:waiting].present?
    @positions = Position.bar(params[:bar]) if params[:bar].present?
    @positions = Position.barista(params[:barista]) if params[:barista].present?
    @positions = Position.chef(params[:chef]) if params[:chef].present?
    @positions = Position.kitchen(params[:kitchen]) if params[:kitchen].present?
    @positions = Position.manager(params[:manager]) if params[:manager].present?
    @positions = Position.assistant(params[:assistant]) if params[:assistant].present?
    @positions = Position.supervisor(params[:supervisor]) if params[:supervisor].present?

    if PgSearch.multisearch(params["q"]).present?
      @positions = PgSearch.multisearch(params["q"])
      @positions = Position.where(id: @positions.map(&:searchable).map(&:id))
    end
    @positions = @positions.near(params[:location], params[:miles]) if params[:location].present?

    @per_page = params[:per_page] || 24 
    @positions = @positions.order('updated_at DESC').paginate( :per_page => @per_page, :page => params[:page])

    gmaps(@positions)

    respond_to do |format|
        format.html
        format.json { render json: @positions, status: :ok }
        format.js
    end
    

    prepare_meta_tags title: "Jobs", description: "Search for jobs in your local area"
  end

  def show
    position
  end

  def new
    new_position
  end

  def edit
    position
  end

  def edit_info
    position
  end

  def edit_detail
    position
  end

  def edit_about
    position
  end

  def edit_all
    position
  end

  def create
    respond_to do |format|
      if new_position(position_params).save
        if @position.form == "info"
          flash[:success] = 'Now add the Job details.'
          format.html { redirect_to edit_detail_position_path(@position) }
        else 
          flash[:success] = 'Job was successfully created, remember to share it on social media!'
          format.html { redirect_to @business }
          format.json { render :show, status: :created, location: @business }
        end
      else
        flash[:danger] = 'There was a problem creating the Job.'
        format.html { render "edit_#{@position.form}" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @position.update(position_params)
        flash[:success] = 'Job was successfully updated, why not share it on social media!'
        format.html { redirect_to @position }
        format.json { render :show, status: :created, location: @position }
      else
        flash[:danger] = 'There was a problem updating the Job.'
        format.html { render "edit_#{@position.form}" }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_info
    position
  end

  def update_detail
    position
  end

  def update_about
    position
  end

  def update_all
    position
  end

  def destroy
    destroy_applications_for(position)
    position.destroy
    respond_to do |format|
      flash[:success] = 'Job was successfully deleted.'
      format.html { redirect_to :dashboard }
      format.json { head :no_content }
    end
  end

private

  def new_position(vals={})
    @position ||= business.positions.build(vals)
  end

  def position
    @position ||= Position.find(params[:id])
  end

  def scoped_to_business?
    params.keys.include?(:business_id)
  end

  def business
    @business ||=  Business.find(params[:business_id])
  end

  def position_params
    params.require(:position).permit(:title, :category, :bracket, :rank, :openings, 
                                      :start_date, :weekly_hours, :wage, 
                                      :age_restricted, :customer_facing, :dress_code, :tips, 
                                      :tagline, :description, :roles_and_responsibilities, :desired_sqa, 
                                      :status, :business_type, :longitude, :latitude, :postcode, :area, :bracket_name, :category_name, :form)
  end

  def searched?
    params.keys.include?("search")
  end

  def gmaps(positions)
    @postions = positions
  	@hash = Gmaps4rails.build_markers(@positions) do |position, marker|
  	  marker.lat position.latitude
  	  marker.lng position.longitude
  	  marker.infowindow render_to_string(:partial => "/positions/map_marker", :locals => { :position => position}) 
  	  marker.json({ title: position.title })
    end
  end


end
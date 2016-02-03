class ExperiencesController < ApplicationController

  def index
    experiences
  end

  def show
    experience
  end

  def new
    new_experience
  end

  def edit
    experience
  end

  def create
    respond_to do |format|
      if new_experience(experience_params).save
        flash[:success] = 'Experience was successfully added.'
        format.html { redirect_to @hunter }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem creating the Experience, please try again.'
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if experience.update_attributes(experience_params)
        flash[:success] = 'Experience was successfully updating.'
        format.html { redirect_to current_user.group }
        format.json { render :show, status: :created, location: @position }
      else
        flash[:danger] = 'There was a problem updating the Experience, please try again.'
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    experience.destroy
    respond_to do |format|
      flash[:success] = 'Experience was successfully deleted.'
      format.html { redirect_to current_user.group }
      format.json { head :no_content }
    end
  end

private

  def new_experience(vals={})
    @experience ||= hunter.experiences.build(vals)
  end

  def experience
    @experience ||= Experience.find(params[:id])
  end

  def experiences
    @experiences ||= hunter.experience.find(params[:id])
  end

  def hunter
    @hunter ||= Hunter.find(params[:hunter_id])
  end

  def experience_params
    params.require(:experience).permit(:job_title, :employer, :location, :start_date, :end_date, :tagline, :job_description, 
                                        :roles_and_responsibilities, :personal_comment, :current_role, :customer_facing, :category)
  end

end


class EducationsController < ApplicationController

  def index
    get_hunter.educations
  end

  def show
    get_education
  end

  def new
    new_education
  end

  def edit
    get_education
  end

  def create
    respond_to do |format|
      if new_education(education_params).save
        flash[:success] = 'Education was successfully added.'
        format.html { redirect_to current_user.group }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem creating the Education, please try again.'
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if get_education.update_attributes(education_params)
        flash[:success] = 'Education was successfully updating.'
        format.html { redirect_to current_user.group }
        format.json { render :show, status: :created, location: @position }
      else
        flash[:danger] = 'There was a problem updating the Education, please try again.'
        format.html { render :edit }
        format.json { render json: @position.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_education.destroy
    respond_to do |format|
      flash[:success] = 'Education was successfully deleted.'
      format.html { redirect_to current_user.group }
      format.json { head :no_content }
    end
  end

private

  def new_education(vals={})
    @education ||= get_hunter.educations.build(vals)
  end

  def get_education
    @education ||= Education.find(params[:id])
  end

  def get_hunter
    @hunter ||= Hunter.find(params[:hunter_id])
  end

  def education_params
    params.require(:education).permit(:institution, :qualification, :subject, :result, :start_date, :end_date, :comment)
  end

end

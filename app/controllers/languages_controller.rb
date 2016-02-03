class LanguagesController < ApplicationController

  def index
    get_hunter.languages
  end

  def show
    get_language
  end

  def new
    new_language
  end

  def edit
    get_language
  end

  def create
    respond_to do |format|
      if new_language(language_params).save
        flash[:success] = 'Language was successfully added.'
        format.html { redirect_to @hunter }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem creating the Language.'
        format.html { render :new }
        format.json { render json: @hunter.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if get_language.update_attributes(language_params)
        flash[:success] = 'Language was successfully updated.'
        format.html { redirect_to current_user.group }
        format.json { render :show, status: :created, location: @hunter }
      else
        flash[:danger] = 'There was a problem updating the Language.'
        format.html { render "edit_language" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    get_language.destroy
    respond_to do |format|
      flash[:success] = 'Language was successfully deleted.'
      format.html { redirect_to current_user.group }
      format.json { head :no_content }
    end
  end

private

  def new_language(vals={})
    @language ||= get_hunter.languages.build(vals)
  end

  def get_language
    @language ||= Language.find(params[:id])
  end

  def get_hunter
    @hunter ||= Hunter.find(params[:hunter_id])
  end

  def language_params
    params.require(:language).permit(:name, :level, :spoken_level, :written_level, :reading_level, :comment)
  end

end

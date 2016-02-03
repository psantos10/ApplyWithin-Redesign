class PhotosController < ApplicationController
  
  def new
    new_photo
  end

  def create
    if new_photo(photo_params).save
      redirect_to current_user.group
    else 
      render :new, notice: "Sorry, something went wrong"
    end

  end

  def destroy
    get_photo
    @photo.destroy
    redirect_to current_user.group
  end

  private

  def new_photo(attrs={})
    @photo ||= current_user.group.default_gallery.photos.build(attrs)
  end

  def photo_params
    params.require(:photo).permit(:file)
  end

  def correct_photo
    @photo = current_user.gallery.photo.find_by_id(params[:id])
  end

  def get_photo
    @photo ||= Photo.find(params[:id])
  end

end

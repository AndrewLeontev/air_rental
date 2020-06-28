class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img)
      end

      @photos = @room.photos
      redirect_back(fallback_location: request.referer, notice: t(:label_save_successful))
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy
  end
end
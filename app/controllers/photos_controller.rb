class PhotosController < ApplicationController
  def create
    @room = Room.find(params[:room_id])

    if params[:images]
      params[:images].each do |img|
        @room.photos.create(image: img)
      end

      @photos = @room.photos
      @message = t(:label_save_successful)
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @room = @photo.room

    @photo.destroy
  end
end
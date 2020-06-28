class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :new, :create]
  before_action :find_room, except: [:index, :new, :create]
  before_action :is_authorised, except: [:show, :index, :new, :create]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to listing_room_path(@room), notice: t(:label_save_successful)
    else
      flash[:alert] =  t(:label_save_unsuccessful)
      render :new
    end
  end

  def show
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def update
    if @room.update(room_params)
      flash[:notice] =  t(:label_save_successful)
    else
      flash[:alert] =  t(:label_save_unsuccessful)
    end

    redirect_back(fallback_location: request.referer)
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end

  def is_authorised
    redirect_to root_path, alert: t(:alert_dont_have_permissions) unless current_user.id == @room.user_id
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_room, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
  end
end

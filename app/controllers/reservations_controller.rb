class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.find(params[:room_id])

    if current_user == room.user
      flash[:error] = t(:error_author_reservation)
    else
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1

      @reservation = current_user.reservations.build(reservation_params)
      @reservation.room_id = room.id
      @reservation.price = room.price
      @reservation.total = days * room.price
      @reservation.save

      flash[:notice] = t(:label_booked_successfully)
    end

    redirect_to room
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new(event_id: params[:event_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      EventMailer.send_when_complete(current_user).deliver
      redirect_to events_path, notice: '応募が完了しました！'
      @reservation.event.event_people -= @reservation.reservation_people
      @reservation.event.save
    else
      render :new
    end
  end

  private
  def reservation_params
    params.require(:reservation)
          .permit(
            :reservation_name, :reservation_tel, :reservation_people,
            :event_id, :user_id
          )
  end
end
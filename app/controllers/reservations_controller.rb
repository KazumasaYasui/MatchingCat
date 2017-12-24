class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def create_reservation
    @event = Event.find(params[:event_id])
    @reservation = current_reservation
    @reservation.event_id = @event.id
    @reservation.user_id = current_user.id
    @reservation.save
    session[:reservation_id] = @reservation.id
    redirect_to view_reservation_path
  end

  def view_reservation
    @reservation = current_reservation
  end

  def complete_reservation
    @reservation = current_reservation
    @reservation.attributes = reservation_params
    if @reservation.save(context: :complete_reservation)
      EventMailer.send_when_complete(current_user).deliver
      redirect_to events_path, notice: '応募が完了しました！'
      @reservation.event.event_people -= @reservation.reservation_people
      @reservation.event.save
      session[:reservation_id] = nil
    else
      render :view_reservation
    end
  end

  private
  def reservation_params
    params.require(:reservation)
          .permit(
            :reservation_name, :reservation_tel, :reservation_people
          )
  end
end
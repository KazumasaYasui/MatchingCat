class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_order
  helper_method :current_reservation

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_reservation
    if !session[:reservation_id].nil?
      Reservation.find(session[:reservation_id])
    else
      Reservation.new
    end
  end
end

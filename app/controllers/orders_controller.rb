class OrdersController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.new(cat_id: params[:cat_id])
  end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      CatMailer.send_when_complete(current_user).deliver
      redirect_to cats_path, notice: '応募が完了しました！'
      @order.cat.cat_status = false
      @order.cat.save
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order)
          .permit(
            :order_name, :order_tel, :order_birth, :order_sex,
            :order_postal_code, :order_prefecture, :order_city,
            :order_address, :order_occupation, :order_income,
            :order_residence, :order_description,
            :cat_id, :user_id
          )
  end
end

class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create_order
    @cat = Cat.find(params[:cat_id])
    @order = current_order
    @order.cat_id = @cat.id
    @order.user_id = current_user.id
    @order.save
    session[:order_id] = @order.id
    # binding.pry
    redirect_to view_order_path
  end

  def view_order
    # binding.pry
    @order = current_order
  end

  def complete_order
    @order = current_order
    @order.attributes = order_params
    if @order.save(context: :complete_order)
      CatMailer.send_when_complete(current_user).deliver
      redirect_to cats_path, notice: '応募が完了しました！'
      @order.cat.cat_status = false
      @order.cat.save
      session[:order_id] = nil
    else
      render :view_order
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
          )
  end
end

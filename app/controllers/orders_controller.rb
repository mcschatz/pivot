class OrdersController < ApplicationController
  def index
    order_creator = OrderCreator.new(order_params)
    if order_creator.generate
      cart.clear
      flash.notice = "Order placed!"
      redirect_to dashboard_path
    else
      flash.notice = "Unable to place order"
      redirect_to cart_path
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    {cart: cart,
      user: current_user,
      will_pay: params[:will_pay]}
  end
end

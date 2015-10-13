class Admin::OrdersController < AdminController
  def index
    @counts = Order.status_counts
    @orders = Order.all
  end

  def by_status
    status = params[:status].capitalize
    if Order.legal_status.include?(status)
      @orders = Order.by_status(status)
    else
      render_404("Bad status code")
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])
    order.change_status(params[:new_status])
    redirect_to request.referrer
  end
end

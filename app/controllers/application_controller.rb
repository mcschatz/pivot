class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :cart, :cart_total, :current_user, :current_admin?, :to_short

  def current_user
    clear_bad_session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def clear_bad_session
    if session[:user_id] && !(User.pluck("id").include?(session[:user_id]))
      session[:user_id] = nil
    end
  end

  def cart
    if session[:cart]
      @cart ||= Cart.new(session[:cart]["items"])
    else
      @cart = Cart.new
    end
  end

  def current_admin?
    current_user && current_user.role == "admin"
  end

  def to_short(date)
    date.strftime(format='%-m/%-d/%-y')
  end

  def verify_logged_in
    if !current_user
      session[:redirect] = request.referrer
      flash.notice = "Please Sign In or Create an Account Before Continuing"
      redirect_to signin_or_signup_path
    end
  end

  def render_404(msg = "Page not found")
    flash[:error] = msg
    redirect_to error_path status: 404
    # raise ActionController::RoutingError.new('
  end

end

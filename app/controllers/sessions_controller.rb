class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def new
    @message = "#{params[:message]} please try again." if params[:message]
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    flash[:notice] = "Login successful"
    redirect_to dashboard_or_prev
  end

  def show
    @gives = current_user.gives
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end

  def error

  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end

  def dashboard_or_prev
    process_redirect || find_dashboard_path
  end

  def process_redirect
    path = session[:redirect]
    session.delete(:redirect)
    path
  end

  def find_dashboard_path
    if current_admin?
      admin_dashboard_path
    else
      dashboard_path
    end
  end
end

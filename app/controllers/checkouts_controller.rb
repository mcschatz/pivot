class CheckoutsController < ApplicationController
  before_action :verify_logged_in, only:[:new]

  def new
    @address = Address.new
  end

  def confirm
  end

  def create
    @address = Address.new(address_params)
    current_user.address = @address
    redirect_to checkouts_confirm_path
  end

  private
  def address_params
    {full_name: params["full_name"],
      street1: params["street1"],
      street2: params["street2"],
      city: params["city"],
      state: params["state"],
      zip: params["zip"]
    }
  end

  def verify_logged_in
    if !current_user
      session[:redirect] = request.referrer
      redirect_to signin_or_signup_path
    end
  end

end

class AdminController < ApplicationController
  before_action :verify_admin

  private

  def verify_admin
    unless current_admin?
      flash[:error] = "You are not authorized to be here :("
      redirect_to error_path status: 403
    end
  end
end

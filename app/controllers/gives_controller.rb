class GivesController < ApplicationController
  before_action :verify_logged_in, only:[:new]

  def new
    @give = Give.new
  end

  def create
    params[:give][:user_id] = current_user.id
    give = Give.new(give_params)
    if give.save
      flash.notice = "Donation Information Submitted: Status Pending"
      redirect_to dashboard_path
    else
      flash.notice = give.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def give_params
    params.require(:give).permit(:title, :description, :price, :quantity, :picture, :user_id)
  end

end

class ContentController < ApplicationController
  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to content_path
    else
      redirect_to new_content
    end
  end

  def index
    @content = Content.all
  end

  def edit
    @content = Content.find(params[:id])
  end

  def update
    @content = Content.find(params[:id])
    if @content.update(content_params)
      redirect_to content_path
    else
      redirect_to edit_content_path
    end
  end

  def destroy
    @content = Content.find(params[:id])
    @content.delete
    redirect_to content_path
  end

  private
  def content_params
    params.require(:content).permit(:name, :payload)
  end
end
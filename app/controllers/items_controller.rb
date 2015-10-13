class ItemsController < ApplicationController

  before_action :load_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
  end

  def index
    @items = Item.visible
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      flash[:invalid] = "There was problem with your listing."
      redirect_to new_item_path
    end
  end

  def show
    @categories = @item.categories
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to items_path
    else
      render :edit
    end
  end

  def destroy
    @item.delete
    redirect_to items_path
  end

  private

    def item_params
      params.require(:item).permit(:title, :description, :price, :picture)
    end

    def load_item
      @item = Item.find_by(slug: params[:slug])
      render_404("Item not found") if !@item
    end
end

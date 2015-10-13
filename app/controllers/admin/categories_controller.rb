class Admin::CategoriesController < AdminController

  before_action :load_category, only: [:destroy, :edit, :update]

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def destroy

    @category.delete
    redirect_to admin_categories_path
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
    else
      redirect_to admin_categories_path
    end
  end

  def edit

  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Item Successfully Updated"
      redirect_to admin_categories_path
    else
      flash[:notice] = @category.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def load_category
    @category = Category.find(params[:id])
  end
end

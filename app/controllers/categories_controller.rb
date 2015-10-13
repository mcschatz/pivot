class CategoriesController < ApplicationController

  def show
    @category = Category.find_by(slug: params[:slug])
    if !@category
      render_404("Category not found")
    end
  end

end

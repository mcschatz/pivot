class ItemCreator

  def initialize(params)
    @params = params
  end

  def generate
    @item = Item.new(item_params)
    @category = Category.find(category_id)
    @item.categories << @category
    @item
  end

  def category_id
    @params.require(:item).permit(:categories)[:categories].to_i
  end

  def item_params
    @params.require(:item).permit(:title, :description, :price, :picture)
  end
end

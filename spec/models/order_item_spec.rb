require 'rails_helper'

describe 'order_item' do
  before do
    @order = Order.create(status: "Ordered")
    @item = Item.first
  end
  let(:valid_attributes) {
    {order: @order,
    item: @item,
    item_quantity: 7}
  }

  it 'is valid with order, item, price, quantity' do
    oi = OrderItem.new(valid_attributes)
    expect(oi).to be_valid
  end

  it 'must have an order' do
    oi = OrderItem.new(item: @item, order: nil)
    expect(oi).to_not be_valid
  end

  it 'must have an item' do
    oi = OrderItem.new(item: nil, order: @order)
    expect(oi).to_not be_valid
  end

  it 'must have a quantity' do
    oi = OrderItem.new(item: @item, order: @order)
    expect(oi).to_not be_valid
  end

end

class Cart
  include Enumerable
  attr_accessor :cart_data

  def initialize(cart_data=Hash.new(0))
    @cart_data = cart_data
  end

  def items
    self.cart_data.map do |item_id, quantity|
      item = Item.find(item_id)
      CartItem.new(item, quantity)
    end
  end

  def adjust_cart_item_qty(params)
    if params[:add]
      self.increment(params[:item_id])
    elsif params[:remove]
      decrement(params[:item_id])
    else
      remove(params[:item_id])
    end
  end

  def increment(item_id)
    item = Item.find(item_id)
    self.cart_data[item.id.to_s] = self.cart_data[item.id.to_s].to_i + 1
  end

  def decrement(item_id)
    item = Item.find(item_id)
    if self.cart_data[item.id.to_s].to_i > 0
      self.cart_data[item.id.to_s] = self.cart_data[item.id.to_s].to_i - 1
    else
      remove(item_id)
    end
  end

  def clear
    self.each { |item| self.remove(item.id.to_s) }
  end

  def remove(item_id)
    self.cart_data.delete(item_id)
  end

  def total
    self.reduce(0) { |acc, cart_item| acc + (cart_item.price * cart_item.quantity.to_i) }
  end

  def empty?
    !(self.any? { |item| item.quantity.to_i > 0 })
  end

  def each
    self.items.each do |item|
      yield item
    end
  end

end
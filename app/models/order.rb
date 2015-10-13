class Order < ActiveRecord::Base
  include Enumerable

  has_many :order_items
  belongs_to :user
  validates :status, format: { with: /Ordered|Paid|Cancelled|Completed/,
    message: "Status must be one of Ordered, Paid, Cancelled, Completed" }
  
  scope :by_status, -> (status) { where(status: status.to_s.capitalize) }

  def total
    self.reduce(0) { |acc, order_item| acc + (order_item.price * order_item.quantity.to_i) }
  end

  def self.legal_status
    ["Ordered", "Paid", "Completed", "Cancelled"]
  end

  def self.status_counts
    legal_status.map do |status|
      [status, self.where(status: status).count]
    end.to_h
  end

  def empty?
    !(self.any? { |order_item| order_item.quantity.to_i > 0 })
  end

  def change_status(new_status)
    self.status = new_status
    self.save
  end

  def each
    self.order_items.each do |order_item|
      item = Item.find(order_item.item_id)
      display_item = OpenStruct.new(item: item,
                                quantity: order_item.item_quantity,
                                   price: order_item.item_price,
                                   subtotal: order_item.subtotal)
      yield display_item
    end
  end
end
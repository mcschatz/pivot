class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  validates :order_id, presence: true
  validates :item_id, presence: true
  validates :item_quantity, presence: true

  def subtotal
    item_quantity * item_price
  end
end

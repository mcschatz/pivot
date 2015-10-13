class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index:true
      t.belongs_to :item, index:true
      t.integer :order_id
      t.integer :item_id
      t.integer :item_price
      t.integer :item_quantity
    end
  end
end

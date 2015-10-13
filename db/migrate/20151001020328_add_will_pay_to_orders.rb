class AddWillPayToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :will_pay, :string
  end
end

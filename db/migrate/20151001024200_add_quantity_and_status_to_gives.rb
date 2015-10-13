class AddQuantityAndStatusToGives < ActiveRecord::Migration
  def change
    add_column :gives, :quantity, :integer
    add_column :gives, :status, :string, default: "pending"
  end
end

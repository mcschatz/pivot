class AddVisibleToItem < ActiveRecord::Migration
  def change
    add_column :items, :visible, :boolean, default: true
  end
end

class AddSlugToItemsAndCategories < ActiveRecord::Migration
  def change
    add_column :items, :slug, :string
    add_index :items, :slug
    add_column :categories, :slug, :string
    add_index :categories, :slug
  end
end

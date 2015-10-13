class CorrectCategoriesIdeasTableName < ActiveRecord::Migration
  def change
    rename_table :categories_ideas, :categories_items
  end
end

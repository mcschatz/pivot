class CreateCategoriesIdeasTable < ActiveRecord::Migration
  def change
    create_table :categories_ideas_table do |t|
      t.belongs_to :item, index: true
      t.belongs_to :category, index: true
    end

    create_table :categories do |t|
      t.string :name
    end
  end
end

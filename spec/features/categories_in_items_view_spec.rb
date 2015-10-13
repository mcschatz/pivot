require 'rails_helper'

feature 'categories in items view' do
  it 'displays all categories' do
    categories = Category.all
    visit '/items'
    categories.each do |cat|
      expect(page).to have_content(cat.title)
    end
  end

  it "displays an item's categories in individual view" do
    item = Item.first
    visit item_path(item.slug)
    expect(current_path).to eq(item_path(item.slug))
    item.categories.each do |cat|
      expect(page).to have_content(cat.title)
    end
  end
end

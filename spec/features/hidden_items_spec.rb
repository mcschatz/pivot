require 'rails_helper'

feature 'hidden items' do
  before :each do
    @item = Item.first
    @name = @item.title
  end

  it 'will not show a hidden item in index' do
    visit '/items'
    expect(page).to have_content(@name)
    @item.visible = false
    @item.save
    visit '/items'
    expect(page).to_not have_content(@name)
  end

  it 'will allow viewing of hidden item' do
    @item.visible = false
    @item.save
    visit "/items/#{@name}"
    expect(current_path).to eq("/items/#{@name}")
  end

  it 'will not allow item added to cart if hidden' do
    visit "/items/#{@name}"
    expect(current_path).to eq("/items/#{@name}")
    expect(page).to have_button("Add to Cart")
    @item.visible = false
    @item.save
    visit "/items/#{@name}"
    expect(page).to_not have_button("Add to Cart")
  end

end
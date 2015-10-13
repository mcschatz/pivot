require 'rails_helper'

feature 'user can view an item' do
  context 'unauthenticated' do

    it 'can view the list of items' do
      visit '/items'
      expect(page).to have_content('haircut')
      expect(page).to have_content('pencil')
    end

    it 'can view an individual item' do
      visit '/items'
      click_link('internet')
      item = Item.find_by(title: 'internet')
      expect(current_path).to eq(item_path(item.slug  ))
      expect(page).to have_content('not worth the price')
      expect(page).to have_content('$60.16')
    end

  end
end

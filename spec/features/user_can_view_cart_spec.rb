require 'rails_helper'

feature 'user can view their cart' do
  context 'unauthenticated with no items selected' do

    it 'can view an empty cart' do
      visit '/cart'
      within('.table') do
        expect(page).to have_content('Title')
        expect(page).to have_content('Brief Description')
        expect(page).to have_content('Price')
        expect(page).to have_content('Quantity')
        expect(page).to have_content('Subtotal')
      end
      expect(page).to have_content('You have no items in your cart')
    end

  end
end

require 'rails_helper'

feature 'user can add items to a cart' do 
	context 'unauthenticated' do

		it 'can add items to the cart' do
			visit '/items'
			 within('#pencil') do
			 	fill_in("Qty:", with: "2")
      	click_on "Add to Cart"
      	expect(current_path).to eq('/items')
      end
      within('#cat') do
			 	fill_in("Qty:", with: "100")
      	click_on "Add to Cart"
      end
      visit '/cart'
      expect(page).to have_content('pencil')
      expect(page).to have_content('$10.20')
      expect(page).to have_content('$20.40')
      # expect(page).to_not have_content('$Infinity')
    end
  end

  it 'user can not add a qunatity of 0 to the cart' do
			visit '/items'
			 within('#pencil') do
        fill_in("Qty:", with: "0")
      	click_on "Add to Cart"
      	expect(current_path).to eq('/items')
      end
      visit '/cart'
      expect(page).to have_content("You have no items in your cart")
  end

  it 'user cannot add a negative quantity to the cart' do
    visit '/items'
      within('#pencil') do
        fill_in("Qty:", with: "-47")
        click_on "Add to Cart"
        expect(current_path).to eq('/items')
      end
      visit '/cart'
      expect(page).to have_content("You have no items in your cart")
    end
end

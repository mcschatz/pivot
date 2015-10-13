require 'rails_helper'

feature "order is created when user checks out" do
  context 'already signed in' do
    before do
      visit '/signin_or_signup'
      click_link_or_button("twitter-link")
      visit '/items'
      click_link_or_button('pencil')
      click_link_or_button("Add to Cart")
      visit '/cart'
      expect(page).to have_content("pencil")
    end

    it 'creates an order on checkout' do
      item = Item.first
      price = item.price
      click_link_or_button("Checkout")
      click_link_or_button("Proceed to Payment")
      click_link_or_button("Place Order")
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Order placed!")
    end
  end

  context 'not yet signed in' do
    before do
      visit '/items'
      click_link_or_button('pencil')
      click_link_or_button("Add to Cart")
      visit '/cart'
      expect(page).to have_content("pencil")
    end

    it 'is redirected to login upon clicking checkout from cart' do
      click_link_or_button('Checkout')
      expect(current_path).to eq(signin_or_signup_path)
      expect(page).to_not have_content("Order placed")
    end

    it 'can create account and check out after redirection' do
      click_link_or_button('Checkout')
      click_link_or_button("twitter-link")
      expect(current_path).to eq(cart_path)
      expect(page).to have_content("Login successful")
      click_link_or_button('Checkout')
      click_link_or_button("Proceed to Payment")
      click_link_or_button("Place Order")
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Order placed")
    end
  end
end

require 'rails_helper'

feature 'Cart cleared after checkout' do
  before do
    fill_cart
  end

  it 'clears the cart' do
    expect(page).to have_content("pencil")
    click_link_or_button("Checkout")
    click_link_or_button("Proceed to Payment")
    click_link_or_button("Place Order")
    visit '/cart'
    expect(page).to have_content('You have no items in your cart')
  end
end
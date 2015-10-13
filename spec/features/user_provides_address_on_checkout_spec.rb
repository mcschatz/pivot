require 'rails_helper'

feature 'checkout' do
  let(:address) {
    OpenStruct.new(full_name: "Abraham Lincoln",
      add_1: "123 Main St.",
      add_2: "Unit 7",
      city: "Springfield",
      state: "IL",
      zip: "12345")
  }
  before do
    fill_cart
  end

  it 'takes a mailing address on checkout' do
    click_link_or_button('Checkout')
    expect(current_path).to eq('/checkouts/new')
    fill_in 'Full Name', with: address.full_name
    fill_in 'Address First Line', with: address.add_1
    fill_in 'Address Second Line', with: address.add_2
    fill_in 'City', with: address.city
    fill_in 'State', with: address.state
    fill_in 'Zip', with: address.zip
    expect(page).to have_content("You may request financial assistance on next screen")
    click_button("Proceed to Payment")
    expect(current_path).to eq('/checkouts/confirm')
    address.each_pair do |label, value|
      expect(page).to have_content(value)
    end
  end




end
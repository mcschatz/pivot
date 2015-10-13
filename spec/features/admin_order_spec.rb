
#           - The item's name, which is linked to the item page.
#           - Quantity in this order.
#           - Price
#           - Line item subtotal.
#       And I can see the total for the order.
#       And I can see the status for the order.

require 'rails_helper'

feature 'admin order viewing' do
  let(:address) {
    OpenStruct.new(full_name: "Abraham Lincoln",
        add_1: "123 Main St.",
        add_2: "Unit 7",
        city: "Springfield",
        state: "IL",
        zip: "12345")
  }

  before do
    create_order
    login_admin!
  end

  it 'can see informations about the order' do
    visit '/admin/orders/1'
    address.each_pair do |attr, value|
      expect(page).to have_content(value)
    end
    expect(page).to have_content('pencil')
    expect(page).to have_content('10.20')
  end
end

require 'rails_helper'

feature 'admin order viewing' do
  before do
    login_user!
    10.times do
      create_order
    end
    login_admin!
  end

  it 'sees correct number of ordered items' do
    visit "/admin/orders"
    expect(page).to have_link("10", "/admin/orders/by_status/ordered")
  end

  it 'status counts change with status change button clicking' do
    visit "/admin/orders"
    expect(page).to have_link("Mark as Paid")
    3.times { first(:link, "Mark as Paid").click }
    expect(page).to have_link("7", "/admin/orders/by_status/ordered")
    expect(page).to have_link("3", "/admin/orders/by_status/paid")
    3.times { first(:link, "Cancel").click }
    expect(page).to have_link("3", "/admin/orders/by_status/cancelled")
    2.times { first(:link, "Mark as Completed").click }
    expect(page).to have_link("2", "/admin/orders/by_status/paid")
  end

end
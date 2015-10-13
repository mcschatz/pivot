module OrderHelpers
  def create_order
    visit '/signin_or_signup'
    click_link_or_button("twitter-link")
    visit '/items'
    click_link_or_button('pencil')
    click_link_or_button("Add to Cart")
    visit '/cart'
    click_link_or_button("Checkout")
  end
end


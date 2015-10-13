require 'rails_helper'

feature 'can give items' do

  context 'unauthenticated user' do

    it 'is asked to login or create account' do
      visit '/'
      click_on 'Give'
      expect(current_path).to eq('/give')
      expect(page).to have_content('Thank you for your interest in donating!')
      click_on("Donate")
      expect(current_path).to eq('/signin_or_signup')
      expect(page).to have_content('Please Sign In or Create an Account Before Continuing')
      click_on("twitter-link")
      expect(current_path).to eq('/give')
      click_on("Donate")
      expect(current_path).to eq('/gives/new')
    end
  end

  context 'authenticated user' do

    it 'can post something to give' do
      login_user!
      visit '/give'

      click_on("Donate")
      fill_in "give_title", with: "Test Give"
      fill_in "give_description", with: "Test Give Description"
      fill_in "give_price", with: "1934"
      fill_in "give_quantity", with: "32"
      click_on("Submit Donation")

      expect(current_path).to eq('/dashboard')
      within("#give-history") do
        expect(page).to have_content("Test Give")
        expect(page).to have_content("Test Give Description")
        expect(page).to have_content("32")
        expect(page).to have_content("pending")
      end
    end
  end

end

require 'rails_helper'

feature 'user can visit contact page' do
	context 'by clicking link in navbar from anywhere' do

		it 'can see an email link' do
			visit '/items'
			click_on("Contact")
			expect(current_path).to eq("/contact")
			within('#contact') do
				expect(page).to have_content("Send us an email at:")
				expect(page).to have_content("or call at:")
				expect(page).to have_content("givenget@fakeemails.com")
				expect(page).to have_content("325-368-6237")
			end
		end
	end
end
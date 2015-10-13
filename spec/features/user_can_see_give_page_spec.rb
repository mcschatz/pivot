require 'rails_helper'

feature 'user can see give page' do
	context 'unauthenticated user' do

		it 'can see the email' do
			visit '/give'
			expect(page).to have_content('Thank you for your interest in donating!')
		end
	end
end
require 'rails_helper'

feature 'landing page' do
  it 'user sees welcome page when visitng root' do
    visit '/'
    expect(page).to have_content('Give what you can. Get what you need.')
    expect(page).to have_content('Give')
    expect(page).to have_content('Get')
  end

  it 'user clicks on donate link to go donate items page' do
    visit '/'
    click_on 'Give'
    expect(current_path).to eq(give_path)
  end

  it 'user clicks on view items link to go to items index path' do
    visit '/'
    click_on 'Get'
    expect(current_path).to eq(items_path)
  end
end

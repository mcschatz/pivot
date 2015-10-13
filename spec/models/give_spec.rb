require 'rails_helper'

describe 'give' do
  context 'with valid attributes' do

  let(:attributes){{user_id: 1,
                    title: 'completelydifferentpencil',
                    description: 'totally different bulk pencils',
                    price: 1021,
                    quantity: 3,
                    image: 'https://pencil-outlet.com',}}

    it 'is valid with valid attributes' do
      give = Give.new(attributes)
      expect(give.user_id).to eq(1)
      expect(give.title).to eq('completelydifferentpencil')
      expect(give.description).to eq('totally different bulk pencils')
      expect(give.price).to eq(1021)
      expect(give.image).to eq('https://pencil-outlet.com')
      expect(give).to be_valid
    end

  end

  context 'with invalid attributes' do

    let(:attributes){{title: 'completelydifferentpencil',
                      description: 'totally different bulk pencils',
                      price: 1021,
                      image: 'https://pencil-outlet.com'}}

    it 'requires title attributes' do
      give = Give.new(attributes)
      give.title = nil

      expect(give).to_not be_valid
    end

    it 'requires description attributes' do
      give = Give.new(attributes)
      give.description = nil

      expect(give).to_not be_valid
    end

    it 'requires price attributes' do
      give = Give.new(attributes)
      give.price = nil
    end
  end

end

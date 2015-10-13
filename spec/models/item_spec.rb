require 'rails_helper'

describe 'item' do
  context 'with valid attributes' do

  let(:attributes){{title: 'completelydifferentpencil',
                    description: 'totally different bulk pencils',
                    price: 1021,
                    image: 'https://pencil-outlet.com',
                    categories: [Category.first]}}

    it 'is valid with valid attributes' do
      item = Item.new(attributes)
      expect(item.title).to eq('completelydifferentpencil')
      expect(item.description).to eq('totally different bulk pencils')
      expect(item.price).to eq(1021)
      expect(item.image).to eq('https://pencil-outlet.com')
      expect(item).to be_valid
    end

  end

  context 'with invalid attributes' do

    let(:attributes){{title: 'completelydifferentpencil',
                      description: 'totally different bulk pencils',
                      price: 1021,
                      image: 'https://pencil-outlet.com',
                      categories: [Category.first]}}

    let(:without_category){{title: 'completelydifferentpencil',
                      description: 'totally different bulk pencils',
                      price: 1021,
                      image: 'https://pencil-outlet.com'}}

    it 'requires title attributes' do
      item = Item.new(attributes)
      item.title = nil

      expect(item).to_not be_valid
    end

    it 'requires description attributes' do
      item = Item.new(attributes)
      item.description = nil

      expect(item).to_not be_valid
    end

    it 'requires price attributes' do
      item = Item.new(attributes)
      item.price = nil
    end

    it "must have a category" do
      item = Item.new(without_category)
      expect(item).to_not be_valid
    end
  end

end

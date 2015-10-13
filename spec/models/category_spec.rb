require 'rails_helper'

describe 'category' do
  let(:title){
    {title: "Supplies"}
  }
  it 'has a title' do
    cat = Category.new(title)
    expect(cat.title).to eq(title[:title])
  end

  it 'must have a title' do
    cat = Category.new(title: nil)
    expect(cat).to_not be_valid
  end

end
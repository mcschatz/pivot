require 'rails_helper'

describe 'identity' do

  let(:attributes){{name: 'test_user',
                    email: 'user@test.com',
                    password_digest: '123abc'}}

  before(:each) do
    @identity = Identity.new(attributes)
  end

  context 'with valid attributes' do

    it 'is valid with valid attributes' do
      expect(@identity.name).to eq('test_user')
      expect(@identity.email).to eq('user@test.com')
      expect(@identity.password_digest).to eq('123abc')
      expect(@identity).to be_valid
    end

  end

  context 'with invalid attributes' do

    it 'requires name attribute' do
      @identity.name = nil

      expect(@identity).to_not be_valid
    end

    it 'requires email attribute' do
      @identity.email = nil

      expect(@identity).to_not be_valid
    end

    it 'requires password_digest attribute' do
      @identity.password_digest = nil

      expect(@identity).to_not be_valid
    end

  end

  context 'with non-unique email' do

    let(:other_attributes){{name: 'another_user',
                      email: 'user@test.com',
                      password_digest: '321cba'}}

    it 'is invalid' do
      @identity.save
      identity2 = Identity.new(other_attributes)

      expect(identity2).to_not be_valid
    end
  end

end

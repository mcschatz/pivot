require 'rails_helper'

describe 'user' do

  let(:attributes){{provider: 'twitter',
                    uid: '123',
                    name: 'test_user',
                    token: '123abc',
                    secret: 'secretsquirrel'}}

  before(:each) do
    @user = User.new(attributes)
  end

  context 'with valid attributes' do

    it 'is valid with valid attributes' do
      expect(@user.provider).to eq('twitter')
      expect(@user.uid).to eq('123')
      expect(@user.name).to eq('test_user')
      expect(@user.token).to eq('123abc')
      expect(@user.secret).to eq('secretsquirrel')
      expect(@user).to be_valid
    end

  end

  context 'with invalid attributes' do

    it 'requires provider attribute' do
      @user.provider = nil

      expect(@user).to_not be_valid
    end

    it 'requires uid attribute' do
      @user.uid = nil

      expect(@user).to_not be_valid
    end

    it 'requires name attribute' do
      @user.name = nil

      expect(@user).to_not be_valid
    end

  end

  context 'with non-unique uid' do

    let(:other_attributes){{provider: 'twitter',
                      uid: '123',
                      name: 'another_user',
                      token: '321cba',
                      secret: 'secretmoose'}}

    it 'is invalid' do
      @user.save
      user2 = User.new(other_attributes)

      expect(user2).to_not be_valid
    end
  end

end

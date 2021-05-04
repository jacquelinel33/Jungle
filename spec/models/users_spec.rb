require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    before :each do
      @user = User.new(:first_name => 'John', :last_name => 'Smith', :email => 'test@gmail.com', :password => 'tests', :password_confirmation => 'tests')
    end

    it 'should save user is all params are set' do
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to be_empty
    end

    it 'should not validate if email is nil' do
      @user.email = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).not_to be_empty
    end

    it 'should not validate if first name is nil ' do    
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).not_to be_empty
    end

    it 'should not validate if last name is nil' do
    @user.last_name = nil
    @user.save
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).not_to be_empty
    end

    it 'should not validate if passwords do not match' do
      @user.password_confirmation = 'wrongpw'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).not_to be_empty
    end
    
    it 'should not validate if there are no passwords entered' do
      @user.password = nil
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).not_to be_empty
    end

    it 'should not validate if email is not unique' do
      @user.save
      @user2 = User.new(:first_name => 'Jane', :last_name => 'Doe', :email => 'test@gmail.com', :password => 'tests', :password_confirmation => 'tests')
      @user2.save
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).not_to  be_empty
    end

  it 'should not validate if passwords are less than minimum length of 3' do
    @user.password = 't'
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).not_to be_empty
  end
end

  describe '.authenticate_with_credentials' do

    before :each do
      @user = User.new(:first_name => 'John', :last_name => 'Smith', :email => 'testing@gmail.com', :password => 'tests', :password_confirmation => 'tests')
    end

    it 'should not return nil if successfully authenticated' do
      @user.save
      @user = User.authenticate_with_credentials('testing@gmail.com', 'tests')
      expect(@user).not_to be(nil)
    end

    it 'should return nil if unsuccessfully authenticated' do
      @user.save
      @user = User.authenticate_with_credentials('testing@gmail.com', 'wrongpw')
      expect(@user).to be(nil)
    end

    it 'should not be nil if email is typed with a few spaces before and after email address' do
      @user.save
      @user = User.authenticate_with_credentials('testing@gmail.com    ', 'tests')
      expect(@user).not_to be(nil)
    end

    it 'should not be nil is visitor types in wrong email case' do
      @user.save
      @user = User.authenticate_with_credentials('TESting@gmail.com', 'tests')
      expect(@user).not_to be(nil)

    end

  end
end

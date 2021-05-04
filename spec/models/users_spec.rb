require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    before :each do
      @user = User.new(:first_name => 'John', :last_name => 'Smith', :email => 'test@gmail.com', :password => 'test', :password_confirmation => 'test')
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
      expect(@user.errors.full_messages).not_to  be_empty
    end
    
    it 'should not validate if there are no passwords entered' do
      @user.password_confirmation = 'wrongpw'
      @user.save
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).not_to  be_empty
    end

    # it 'should not validate if email is not unique' do
    # end

#   it 'should '
  # end
  end
end

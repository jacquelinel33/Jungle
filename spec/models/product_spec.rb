require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    before do
      @category = Category.new(:name => "Test")
      @product = Product.new(:name => "Test Product", :price => 10, :quantity => 500, :category => @category)
    end 
    
    it 'should not validate if category is nil' do
      @nocategory = Product.new(:name => "Test Product", :price => 10, :quantity => 500)
      expect(@nocategory).to_not be_valid
      expect(@nocategory.errors.full_messages).not_to be_empty
    end

    it 'should save products when all required fields are set' do
      expect(@product.errors.full_messages).to be_empty
      expect(@product).to be_valid
    end

    it 'should not validate if name is nil' do
      @product.name = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).not_to be_empty
    end

    it 'should not validate if price is nil' do
      @product.price_cents = nil
      @product.save
      puts @product.inspect
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).not_to be_empty
    end

    it 'should not validate if quantity is nil' do
      @product.quantity = nil
      @product.save
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).not_to be_empty
    end
  end
end

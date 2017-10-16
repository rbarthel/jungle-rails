require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context 'given all 4 fields' do
      it 'saves successfully' do
        electronics = Category.new(name: 'Electronics')
        product = Product.new(name: 'iphone', price: '999', quantity: '2', category: electronics)
        expect(product).to be_valid
      end
    end
    context 'given no name' do
      it 'should return an error' do
        electronics = Category.new(name: 'Electronics')
        product = Product.new(price: '999', quantity: '2', category: electronics)
        expect(product).to_not be_valid
        expect(product.errors.messages[:name]).to include("can't be blank")
      end
    end
    context 'given no price' do
      it 'should return an error' do
        electronics = Category.new(name: 'Electronics')
        product = Product.new(name: 'iphone', quantity: '2', category: electronics)
        expect(product).to_not be_valid
        expect(product.errors.messages[:price]).to include("can't be blank")
      end
    end
    context 'given no quantity' do
      it 'should return an error' do
        electronics = Category.new(name: 'Electronics')
        product = Product.new(name: 'iphone', price: '999', category: electronics)
        expect(product).to_not be_valid
        expect(product.errors.messages[:quantity]).to include("can't be blank")
      end
    end
    context 'given no category' do
      it 'should return an error' do
        electronics = Category.new(name: 'Electronics')
        product = Product.new(name: 'iphone', price: '999', quantity: '2')
        expect(product).to_not be_valid
        expect(product.errors.messages[:category]).to include("can't be blank")
      end
    end
  end
end

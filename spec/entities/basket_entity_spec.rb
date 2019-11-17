require 'spec_helper'
require './basket/entities/basket_entity'

RSpec.describe Basket::Entities::BasketEntity do
  describe '#total_price' do
    it 'returns 0 if basket empty' do
      basket = Basket::Entities::BasketEntity.new

      expect(basket.total_price).to eq(0)
    end

    it 'returns total price of added products' do
      products = [double('product1', price: 5), double('product2', price: 10)]
      basket = Basket::Entities::BasketEntity.new(products: products)

      expect(basket.total_price).to eq(products.map(&:price).sum)
    end
  end

  describe '#total_discount' do
    context 'when basket is empty' do
      it 'returns 0 if there is no discounts' do
        basket = Basket::Entities::BasketEntity.new

        expect(basket.total_discount).to eq(0)
      end

      it 'returns total discount can be applied to cart' do
        products = [double('product1', price: 5), double('product2', price: 10)]
        promotions = [double('promotion1',
          basket_rule_method: :products,
          application_rule: Proc.new { |products| products.map(&:price).sum > 10 },
          rule: Proc.new { |total_price| total_price % 0.1 }
        )]

        basket = Basket::Entities::BasketEntity.new(products: products, promotions: promotions)

        expect(basket.total_discount).to eq(products.map(&:price).sum % 0.1)
      end
    end
  end

  describe '#discounted_price' do
    it 'returns 0 if total_discount is' do
      products = [double('product1', price: 5), double('product2', price: 10)]
      basket = Basket::Entities::BasketEntity.new(products: products)

      expect(basket.discounted_price).to eq(0)
    end

    it 'subtracts total_discount from total_price' do
        products = [double('product1', price: 5), double('product2', price: 10)]
        promotions = [double('promotion1',
          basket_rule_method: :products,
          application_rule: Proc.new { |products| products.map(&:price).sum > 10 },
          rule: Proc.new { |total_price| total_price % 0.1 }
        )]

        basket = Basket::Entities::BasketEntity.new(products: products, promotions: promotions)

        expect(basket.discounted_price).to eq(basket.total_price - ( products.map(&:price).sum % 0.1 ))
    end
  end
end

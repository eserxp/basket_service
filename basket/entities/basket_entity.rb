# frozen_string_literal: true

require_relative 'base'

module Basket
  module Entities
    class BasketEntity < Basket::Entities::Base
      attr_reader :id,
                  :products,
                  :promotions,
                  :total_price,
                  :total_discount,
                  :discounted_price

      def initialize(id: nil, products: [], promotions: [])
        @id = id
        @products = products
        @promotions = promotions
        @total_price = calculate_total_price
        @total_discount = calculate_total_discount
        @discounted_price = calculate_discounted_price
      end

      private

      def calculate_total_price
        products.map { |product| product&.price }.sum
      end

      def calculate_total_discount
        promotions.map do |promotion|
          if promotion.application_rule.call(send(promotion.basket_rule_method))
            promotion.rule.call(total_price)
          end
        end.sum
      end

      def calculate_discounted_price
        if total_discount > 0
          total_price - total_discount
        else
          0
        end
      end
    end
  end
end

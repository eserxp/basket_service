require_relative 'base'

module Basket
  module Entities
    class BasketEntity < Basket::Entities::Base
      attr_reader :id, :products, :promotions

      def initialize(**kwargs)
        @id = kwargs.fetch(:id, nil)
        @products = kwargs.fetch(:products, [])
        @promotions = kwargs.fetch(:promotions, [])
      end
    end
  end
end

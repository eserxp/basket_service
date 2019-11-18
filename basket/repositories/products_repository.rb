require_relative 'base'

module Basket
  module Repositories
    class ProductsRepository < Basket::Repositories::Base
      def where(kwargs = {})
        products = @database_handler.database['products']

        if !kwargs.empty?
          products.select { |product| kwargs.transform_keys(&:to_s).map { |k, v| product[k] == v }.uniq == [true] }
        else
          products
        end
      end
    end
  end
end

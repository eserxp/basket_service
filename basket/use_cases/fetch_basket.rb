require_relative 'base'
require './basket/entities/basket_entity'

module Basket
  module UseCases
    class FetchBasket < Basket::UseCases::Base
      include Dry::Monads::Do.for(:run)

      def run
        basket_id_parameters = yield validate(params)
        basket_parameters = yield fetch(@repository, basket_id_parameters)

        Success(
          Basket::Entities::BasketEntity.new(
            id: basket_parameters[:id],
            products: basket_parameters[:products].map { |product| Product.new(product) },
            promotions: basket_parameters[:promotions].map { |promotion| Product.new(promotion) }
          )
        )
      end

      private

      def validate(basket_parameters)
        if basket_parameters[:id]
          Success(basket_parameters)
        else
          Failure(:basket_id_required)
        end
      end

      def fetch(basket_repository, basket_parameters)
        Success(basket_repository.where(basket_parameters))
      rescue
        Failure(:db_error)
      end
    end
  end
end

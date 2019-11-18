require_relative 'base'
require './basket/entities/basket_entity'

module Basket
  module UseCases
    class FetchBasket < Basket::UseCases::Base
      include Dry::Monads::Do.for(:run)

      def run
        basket_parameters = yield validate(params)
        products = yield fetch(@repository, basket_id: basket_parameters[:id])

        Success(
          Basket::Entities::BasketEntity.new(
            id: basket_parameters[:id],
            products: products,
            promotions: []
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

      def fetch(basket_repository, **kwargs)
        Success(basket_repository.where(kwargs))
      rescue
        Failure(:db_error)
      end
    end
  end
end

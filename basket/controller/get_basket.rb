# frozen_string_literal: true

require_relative 'base'
require_relative '../repositories/products_repository'
require_relative '../use_cases/fetch_basket'

module Basket
  module Controller
    class GetBasket < Basket::Controller::Base
      def run
        products = Basket::UseCases::FetchBasket.new(context, products_repository).run
        # template_handler(:products, )
      end

      private

      def products_repository
        Basket::Repositories::ProductsRepository.new(database_handler)
        # .fetch(:products, where: { id: params['id'] })
      end
    end
  end
end

# frozen_string_literal: true

require_relative 'base'
require_relative '../repositories/products_repository'
require_relative '../use_cases/fetch_basket'

module Basket
  module Controller
    class GetBasket < Basket::Controller::Base
      def run
        Basket::UseCases::FetchBasket.new(repository: products_repository, params: params).run
      end

      private

      def products_repository
        Basket::Repositories::ProductsRepository.new(database_handler)
      end
    end
  end
end

require 'dry/monads'
require 'dry/monads/do'

module Basket
  module UseCases
    class Base
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:run)

      attr_reader :params, :repository

      def initialize(repository:, params: {})
        @params = params
        @repository = repository
      end
    end
  end
end

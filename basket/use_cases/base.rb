require 'dry/monads'
require 'dry/monads/do'

module Basket
  module UseCases
    class Base
      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:run)

      def initialize(context, repository)
        @context = context
        @repository = repository
      end

      private

      def params
        @context.params || {}
      end
    end
  end
end

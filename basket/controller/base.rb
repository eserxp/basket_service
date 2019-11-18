module Basket
  module Controller
    class Base
      attr_reader :params,
        :database_handler,
        :template_handler

      def initialize(database_handler:, template_handler:, params:)
        @params = params
        @database_handler = database_handler
        @template_handler = template_handler
      end
    end
  end
end

module Basket
  module Controller
    class Base
      attr_reader :context,
        :database_handler,
        :template_handler

      def initialize(context, database_handler, template_handler)
        @context = context
        @database_handler = database_handler
        @template_handler = template_handler
      end
    end
  end
end

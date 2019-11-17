# frozen_string_literal: true

require_relative 'base'

module Basket
  module Repository
    class Base
      attr_reader :database_handler

      def initialize(database_handler, query)
        @database_handler = database_handler
        @query = query
      end
    end
  end
end

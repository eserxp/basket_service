# frozen_string_literal: true

require_relative 'base'

module Basket
  module Repositories
    class Base
      attr_reader :database_handler

      def initialize(database_handler)
        @database_handler = database_handler
      end
    end
  end
end

require 'sinatra/base'

require_relative 'controller/get_basket'

module Basket
  class App < Sinatra::Base
    attr_reader :database_handler, :template_handler

    def initialize(database_handler, template_handler)
      @database_handler = database_handler
      @template_handler = template_handler
    end

    get('/basket/:id', provides: 'json') { Basket::Controller::GetBasket.new(self, database_handler, template_handler).run }
  end
end

# frozen_string_literal: true

require_relative 'basket/app'
require_relative 'lib/database_handler'
require_relative 'lib/template_handler'

run Basket::App.new(DatabaseHandler.new, TemplateHandler.new)

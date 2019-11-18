# frozen_string_literal: true

require_relative 'basket/app'
require_relative 'basket/config'
require_relative 'lib/database_handler'
require_relative 'lib/template_handler'

config = Basket::Config.instance

run Basket::App.new(
  DatabaseHandler.new(config.database_config),
  TemplateHandler.new(config.template_config)
)

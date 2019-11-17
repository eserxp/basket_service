require 'yaml'
require 'singleton'

module Basket
  class Config
    DEFAULT_FILE_PATH = 'basket/config.yml'

    include Singleton

    attr_reader :database_config, :template_config

    def initialize(file_path=DEFAULT_FILE_PATH)
      config_detail = YAML.load(File.read(file_path))

      @database_config = config_detail[:database]
      @template_config = config_detail[:templates]
    end
  end
end

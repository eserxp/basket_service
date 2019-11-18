# frozen_string_literal: true

require 'yaml'

class DatabaseHandler
  attr_reader :config, :database

  def initialize(config)
    @config = config
    @database = fetch_database
  end

  private

  def fetch_database
    Dir[@config['path']].each_with_object({}) do |file_path, hash|
      data = YAML.safe_load(File.read(file_path))
      hash.merge!(data)
    end
  end
end

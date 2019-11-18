require 'spec_helper'
require './lib/database_handler'

require './basket/config'
require './basket/repositories/products_repository'

RSpec.describe Basket::Repositories::ProductsRepository do
  let(:database_handler) { DatabaseHandler.new({'path' => './spec/fixtures/*'}) }

  context '#where' do
    it 'returns all products without any parameters' do
      products_repository = Basket::Repositories::ProductsRepository.new(database_handler)

      expect(products_repository.where.size).to eq(3)
    end

    it 'filters products for given query' do
      products_repository = Basket::Repositories::ProductsRepository.new(database_handler)

      expect(products_repository.where(price: 1.0).size).to eq(1)
    end
  end
end

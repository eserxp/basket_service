require 'spec_helper'
require 'dry/monads'
require './basket/use_cases/fetch_basket'

RSpec.describe Basket::UseCases::FetchBasket do
  include Dry::Monads::Result::Mixin

  describe '#run' do
    it 'returns a validation error if basket id not found' do
      products_repository = double('products repository', where: {})

      use_case = Basket::UseCases::FetchBasket.new(repository: products_repository)

      expect(use_case.run).to eql(Failure(:basket_id_required))
    end

    context 'when basket_id provided' do
      it 'returns a basket entity object' do
        products_repository = double('products repository', where: {})
        params = { id: 1 }

        use_case = Basket::UseCases::FetchBasket.new(repository: products_repository, params: params)

        expect(use_case.run.value!).to be_instance_of(Basket::Entities::BasketEntity)
      end
    end
  end
end

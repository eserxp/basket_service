require 'spec_helper'
require 'dry/monads'

require './basket/use_cases/fetch_basket'

RSpec.describe Basket::UseCases::FetchBasket do
  include Dry::Monads::Result::Mixin

  describe '#run' do
    it 'returns a validation error if basket id not found' do
      context = double('app', params: {})
      products_repository = double('app')

      use_case = Basket::UseCases::FetchBasket.new(context, products_repository)

      expect(use_case.run).to eql(Failure(:basket_id_required))
    end

    context 'when basket_id provided' do
      it 'returns a basket entity object' do
        context = double('app', params: {id: 1})
        products_repository = double('repository', where: {id: 1, products: [], promotions: []})

        use_case = Basket::UseCases::FetchBasket.new(context, products_repository)

        expect(use_case.run.value!).to be_instance_of(Basket::Entities::BasketEntity)
      end
    end
  end
end

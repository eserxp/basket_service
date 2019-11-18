require 'spec_helper'
require 'rack/test'

require './basket/app'
require './basket/controller/get_basket'

RSpec.describe Basket::App do
  include Rack::Test::Methods
  let(:database_handler) { DatabaseHandler.new({'path' => './spec/fixtures/*'}) }
  let(:template_handler) { double('template_handler') }

  def app
    @app ||= Basket::App.new(database_handler, template_handler)
  end

  describe 'GET /basket' do
    it 'calls GetBasketController#run' do
      expect_any_instance_of(Basket::Controller::GetBasket).to receive(:run)

      get '/basket/1'
    end

    it 'return success' do
      get '/basket/1'

      expect(last_response).to be_ok
    end
  end
end

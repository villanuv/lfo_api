$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lfo_api'
require 'webmock/rspec'
require 'sinatra/base'
require 'faraday'
WebMock.disable_net_connect!(allow_localhost: true)


RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /not-real.com/).to_rack(FakeLeapfrogOnline)
  end
end


class FakeLeapfrogOnline < Sinatra::Base
  get '/customer_scoring' do
    @income = params[:income]
    @zipcode = params[:zipcode]
    @age = params[:age]
    json_response 200, 'score.json'
  end

  private

  def json_response(response_code, file_name)
    content_type :json
    status response_code
    File.open(File.dirname(__FILE__) + '/fixtures/' + file_name, 'rb').read
  end
end
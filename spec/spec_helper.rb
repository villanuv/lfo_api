$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'lfo_api'
require 'support/fake_lfo_api'
require 'webmock/rspec'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /not-real.com/).to_rack(FakeLfoApi)
  end
end
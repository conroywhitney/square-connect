$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'coveralls'
Coveralls.wear!

require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

require 'support/fake_square_connect_api'
RSpec.configure do |config|
  config.before(:each) do
    stub_request(:any, /connect.squareup.com/).to_rack(FakeSquareConnectApi)
  end
end

require 'square/connect'

require 'byebug'
require 'awesome_print'

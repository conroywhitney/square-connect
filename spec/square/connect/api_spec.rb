require 'spec_helper'

describe Square::Connect::Api do
  subject(:api) { described_class.new(access_token: access_token, location: location) }
  let(:access_token) { "ACCESS_TOKEN" }
  let(:location) { "LOCATION" }

  specify { expect(api).to be_truthy }
end

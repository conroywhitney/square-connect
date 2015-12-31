require 'spec_helper'

describe Square::Connect::Api do
  subject(:api) { described_class.new(access_token: access_token) }
  let(:access_token) { "ACCESS_TOKEN" }

  specify { expect(api).to be_truthy }
end

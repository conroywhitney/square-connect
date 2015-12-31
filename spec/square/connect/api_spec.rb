require 'spec_helper'

describe Square::Connect::Api do
  subject(:api) { described_class.new(access_token: access_token, location: location) }
  let(:access_token) { "ACCESS_TOKEN" }
  let(:location) { "LOCATION" }

  describe 'constructor' do
    specify { expect(api).to be_truthy }

    specify { expect(api.access_token).to eq "ACCESS_TOKEN" }

    specify { expect(api.location).to eq "LOCATION" }

    context 'with missing access token' do
      let(:access_token) { nil }

      specify { expect { api }.to raise_exception RuntimeError }
    end

    context 'with missing location' do
      let(:location) { nil }

      specify { expect { api }.to raise_exception RuntimeError }
    end
  end
end

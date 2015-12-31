require 'spec_helper'

describe Square::Connect::Request do
  subject(:request) { described_class }

  let(:access_token) { "ACCESS_TOKEN" }
  let(:location) { "LOCATION" }
  let(:path) { "/PATH" }

  describe 'get' do
    let(:response) { request.get(access_token: access_token, location: location, path: path) }
    let(:status) { response['status'] }

    specify { expect(status).to eq "OK" }
  end

  describe 'uri' do
    let(:url) { request.uri(location: location, path: path).to_s }

    specify { expect(url).to eq "https://connect.squareup.com/v1/LOCATION/PATH" }

    context 'with missing location' do
      let(:location) { nil }

      specify { expect { url }.to raise_exception RuntimeError }
    end

    context 'with missing path' do
      let(:path) { nil }

      specify { expect { url }.to raise_exception RuntimeError }
    end

    context 'with non-relative path' do
      let(:path) { 'NONRELATIVEPATH' }

      specify { expect { url }.to raise_exception RuntimeError }
    end
  end
end

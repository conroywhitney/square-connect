require 'spec_helper'

describe Square::Connect::Request do
  subject(:request) { described_class.new(api: api) }

  let(:api) { Square::Connect::Api.new(access_token: access_token, location: location) }
  let(:access_token) { "ACCESS_TOKEN" }
  let(:location) { "LOCATION" }
  let(:path) { "/PATH" }

  describe 'constructor' do
    specify { expect(request).to be_truthy }

    context 'with missing api' do
      let(:api) { nil }

      specify { expect { request }.to raise_exception RuntimeError }
    end
  end

  describe 'get' do
    let(:response) { request.get(path: path) }
    let(:status) { response['status'] }

    specify { expect(status).to eq "OK" }
  end

  describe 'uri' do
    let(:url) { request.uri(path: path).to_s }

    specify { expect(url).to eq "#{Square::Connect::Request::BASE_URL}/LOCATION/PATH" }

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

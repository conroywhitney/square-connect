require 'spec_helper'

describe Square::Connect::Response do
  subject(:response) do
    described_class.new(http_response: http_response, resource_class: resource_class)
  end

  let(:http_response)  { double(Net::HTTPOK, code: 200, body: response_body) }
  let(:response_body)  { '' }
  let(:resource_class) { double }

  context 'minimum viable object' do
    specify { expect(response).to be_truthy }
  end

  describe 'constructor' do
    context 'with missing http response' do
      let(:http_response) { nil }

      specify { expect { response }.to raise_exception RuntimeError }
    end
  end

  describe 'status code' do
    context 'when 200 OK' do
      specify { expect(response.status).to eq 200 }
      specify { expect(response).to be_ok }
    end

    context 'when 401 Unauthorized' do
      let(:http_response) { double(Net::HTTPUnauthorized, code: 401, body: response_body) }

      specify { expect(response.status).to eq 401 }
      specify { expect(response).to_not be_ok }
    end
  end

  describe 'message' do
    context 'delegates to Net::HTTP message' do
      let(:http_response) { double(Net::HTTPResponse, message: 'MESSAGE', body: response_body) }

      specify { expect(response.message).to eq 'MESSAGE' }
    end
  end

  describe 'data' do
    context 'when invalid request' do
      let(:http_response) { double(Net::HTTPUnauthorized, code: 401, body: response_body) }

      specify { expect(response.data).to be_nil }
    end

    context 'with invalid JSON body' do
      it 'raises error if response body is not JSON' do
        expect { response.data }.to raise_exception JSON::ParserError
      end
    end

    context 'with valid JSON body' do
      let(:response_body) { '{ "FOO": "BAR" }' }

      it 'includes the expected values' do
        expect(response.data['FOO']).to eq 'BAR'
      end
    end
  end

  describe 'resource_list' do
    let(:response_body) { '[{ "foo": true }, { "bar": false }]' }

    before { allow(resource_class).to receive(:new).and_return(double) }

    it 'returns an array' do
      expect(response.resource_list.is_a? Array).to eq true
    end

    it 'has the expected number of elements in it' do
      expect(response.resource_list.size).to eq 2
    end

    it 'contains elements of resource type' do
      expect(response.resource_list.map { |r| r.class.name }.uniq).to eq [resource_class.class.name]
    end

    context 'when invalid request' do
      let(:http_response) { double(Net::HTTPUnauthorized, code: 401, body: response_body) }

      specify { expect(response.resource_list).to be_nil }
    end
  end

  describe 'resource' do
    let(:response_body) { '{ "foo": true, "bar": false }' }

    before { allow(resource_class).to receive(:new).and_return(double) }

    it 'returns a single object' do
      expect(response.resource).to be_a(RSpec::Mocks::Double)
    end

    context 'when invalid request' do
      let(:http_response) { double(Net::HTTPUnauthorized, code: 401, body: response_body) }

      specify { expect(response.resource).to be_nil }
    end
  end
end

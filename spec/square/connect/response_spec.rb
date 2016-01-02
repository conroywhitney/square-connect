require 'spec_helper'

describe Square::Connect::Response do
  subject(:response) { described_class.new(http_response: http_response) }

  let(:http_response) { double(Net::HTTPOK, code: 200, body: response_body) }
  let(:response_body) { '' }

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

  describe 'data' do
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
end

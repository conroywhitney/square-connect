require 'spec_helper'

describe Square::Connect::Api do
  subject(:api) { described_class.new(access_token: access_token, location: location) }
  let(:access_token) { "ACCESS_TOKEN" }
  let(:location) { "LOCATION" }

  context 'minimum viable object' do
    specify { expect(api).to be_truthy }
  end

  describe 'access_token' do
    specify { expect(api.access_token).to eq "ACCESS_TOKEN" }
  end

  describe 'location' do
    specify { expect(api.location).to eq "LOCATION" }
  end

  describe 'initialization' do
    context 'with missing access token' do
      let(:access_token) { nil }

      specify { expect { api }.to raise_exception RuntimeError }
    end

    context 'with missing location' do
      let(:location) { nil }

      specify { expect { api }.to raise_exception RuntimeError }
    end
  end

  describe 'items' do
    let(:items) { api.items }

    specify { expect(items.size).to eq 1 }
    specify { expect(items.first.class.name).to eq Square::Connect::Resource::Item.name }
  end
end

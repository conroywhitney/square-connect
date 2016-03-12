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
    let(:items)         { api.items(include_image: include_image) }
    let(:item)          { items.first }
    let(:include_image) { false }

    specify { expect(items.size).to eq 1 }
    specify { expect(items.first.class.name).to eq Square::Connect::Resource::Item.name }

    describe 'include image' do
      let(:images) { item.images }

      context 'false' do
        specify { expect(images).to be_nil }
      end

      context 'true' do
        let(:include_image) { true }

        specify { expect(images).not_to be_empty }
        specify { expect(images.first).to be_a(Square::Connect::Resource::ItemImage) }
      end
    end
  end
end

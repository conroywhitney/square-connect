RSpec.describe Square::Connect::Resource::Item do
  subject(:item)   { described_class.new(response_item) }
  let(:variations) { ['ITEM VARIATION 1', 'ITEM VARIATION 2'] }
  let(:category)   { 'ITEM CATEGORY' }
  let(:response_item) do
    {
      'id' => 'ITEM ID',
      'fees' => ['ITEM FEES'],
      'variations' => variations,
      'available_for_pickup' => 'ITEM PICKUP',
      'available_online' => 'ITEM ONLINE',
      'visibility' => 'ITEM VISIBILITY',
      'description' => 'ITEM DESCRIPTION',
      'name' => 'ITEM NAME',
      'category_id' => 'ITEM CATEGORY ID',
      'category' => category,
      'type' => 'ITEM TYPE'
    }
  end

  describe 'initialize' do
    it { expect(item.id).to eq 'ITEM ID' }
    it { expect(item.fees).to be_an(Array) }
    it { expect(item.fees.first).to eq 'ITEM FEES' }
    it { expect(item.variations).to be_an(Array) }
    it { expect(item.variations.first).to be_a(Square::Connect::Resource::Variation) }
    it { expect(item.available_for_pickup).to eq 'ITEM PICKUP' }
    it { expect(item.available_online).to eq 'ITEM ONLINE' }
    it { expect(item.visibility).to eq 'ITEM VISIBILITY' }
    it { expect(item.description).to eq 'ITEM DESCRIPTION' }
    it { expect(item.name).to eq 'ITEM NAME' }
    it { expect(item.category_id).to eq 'ITEM CATEGORY ID' }
    it { expect(item.category).to be_a(Square::Connect::Resource::Category) }
    it { expect(item.type).to eq 'ITEM TYPE' }

    context 'when response_item is nil' do
      let(:response_item) { nil }

      it { expect { subject }.to raise_error ArgumentError, 'Error parsing Item from nil' }
    end

    context 'does not try to create a category when the response does not contain one' do
      let(:category) { nil }

      it { expect { item }.to_not raise_error }
      it { expect(item.category).to be_nil }
    end

    context 'does not try to create a variations when the response does not contain them' do
      let(:variations) { [nil] }

      it { expect { item }.to_not raise_error }
      it { expect(item.variations).to eq [] }
    end
  end
end

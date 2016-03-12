RSpec.describe Square::Connect::Resource::ItemVariation do
  subject(:variation) { described_class.new(response_variation) }
  let(:response_variation) do
    {
      'inventory_alert_type' => 'VARIATION INVENTORY ALERT TYPE',
      'track_inventory' => 'VARIATION TRACK INVENTORY',
      'pricing_type' => 'VARIATION PRICING TYPE',
      'id' => 'VARIATION ID',
      'name' => 'VARIATION NAME',
      'price_money' => {
        'currency_code' => 'USD',
        'amount' => '12345'
      },
      'sku' => 'VARIATION SKU',
      'ordinal' => 'VARIATION ORDINAL',
      'item_id' => 'VARIATION ITEM ID'
    }
  end

  describe 'initialize' do
    it { expect(variation.inventory_alert_type).to eq 'VARIATION INVENTORY ALERT TYPE' }
    it { expect(variation.track_inventory).to eq 'VARIATION TRACK INVENTORY' }
    it { expect(variation.pricing_type).to eq 'VARIATION PRICING TYPE' }
    it { expect(variation.id).to eq 'VARIATION ID' }
    it { expect(variation.name).to eq 'VARIATION NAME' }
    it { expect(variation.price).to be_an_instance_of(Money) }
    it { expect(variation.price.format).to eq '$123.45' }
    it { expect(variation.sku).to eq 'VARIATION SKU' }
    it { expect(variation.ordinal).to eq 'VARIATION ORDINAL' }
    it { expect(variation.item_id).to eq 'VARIATION ITEM ID' }

    context 'when response_variation is nil' do
      let(:response_variation) { nil }

      it { expect { subject }.to raise_error ArgumentError, 'Error parsing ItemVariation from nil' }
    end
  end
end

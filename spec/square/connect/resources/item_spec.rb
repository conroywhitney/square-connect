RSpec.describe Square::Connect::Resource::Item do
  subject(:item) { described_class.new(response_item) }
  let(:response_item) do
    {
      'id' => 'ID',
      'fees' => ["FEES"],
      'variations' => ['VARIATION 1', 'VARIATION 2'],
      'available_for_pickup' => 'PICKUP',
      'available_online' => 'ONLINE',
      'visibility' => 'VISIBILITY',
      'description' => 'DESCRIPTION',
      'name' => 'NAME',
      'category_id' => 'CATEGORY ID',
      'category' => 'CATEGORY',
      'type' => 'TYPE'
    }
  end

  describe 'initialize' do
    it { expect(item.id).to eq 'ID' }
    it { expect(item.fees).to eq ['FEES'] }
    it { expect(item.variations).to eq ['VARIATION 1', 'VARIATION 2'] }
    it { expect(item.available_for_pickup).to eq 'PICKUP' }
    it { expect(item.available_online).to eq 'ONLINE' }
    it { expect(item.visibility).to eq 'VISIBILITY' }
    it { expect(item.description).to eq 'DESCRIPTION' }
    it { expect(item.name).to eq 'NAME' }
    it { expect(item.category_id).to eq 'CATEGORY ID' }
    it { expect(item.category).to eq 'CATEGORY' }
    it { expect(item.type).to eq 'TYPE' }
  end
end

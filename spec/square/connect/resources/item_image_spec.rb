RSpec.describe Square::Connect::Resource::ItemImage do
  subject(:item_image) { described_class.new(response_item_image) }
  let(:response_item_image) do
    {
      'id' => 'ITEM IMAGE ID',
		  'url' => 'ITEM IMAGE URL'
    }
  end

  describe 'initialize' do
    it { expect(item_image.id).to eq 'ITEM IMAGE ID' }
    it { expect(item_image.url).to eq 'ITEM IMAGE URL'}

    context 'with a null item' do
      let(:response_item_image) { nil }

      it { expect { subject }.to raise_error ArgumentError, 'Error parsing ItemImage from nil' }
    end
  end
end

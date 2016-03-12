RSpec.describe Square::Connect::Resource::Category do
  subject(:category) { described_class.new(response_category) }
  let(:response_category) do
    {
      'id' => 'CATEGORY ID',
		  'name' => 'CATEGORY NAME'
    }
  end

  describe 'initialize' do
    it { expect(category.id).to eq 'CATEGORY ID' }
    it { expect(category.name).to eq 'CATEGORY NAME'}
  end
end

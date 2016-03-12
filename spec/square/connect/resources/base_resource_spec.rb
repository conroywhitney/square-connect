RSpec.describe Square::Connect::Resource::BaseResource do
  describe 'initialize' do
    let(:resource) { described_class.new }

    it 'should raise an error that it is an abstract class' do
      expect { resource }.to(
        raise_error(
          RuntimeError,
          'Square::Connect::Resource::BaseResource is an abstract class'
        )
      )
    end
  end

  describe 'parse' do
    let(:parsed_data) { described_class.parse(data) }
    let(:data) { '' }

    context 'when nil' do
      let(:data) { nil }

      it { expect { parsed_data }.to_not raise_error }
      it { expect(parsed_data).to eq nil }
    end

    context 'when array of nils' do
      let(:data) { [nil, nil, nil] }

      it { expect { parsed_data }.to_not raise_error }
      it { expect(parsed_data).to eq [] }
    end

    context 'when has array of data' do
      let(:data) { [ { "foo": true }, { "bar": true } ] }
    end

    context 'when has a single object' do
      let(:data) { { "foo": true, "bar": true } }
    end
  end
end

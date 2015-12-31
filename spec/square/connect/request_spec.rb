require 'spec_helper'

describe Square::Connect::Request do
  subject(:request) { described_class.new }
  let(:path) { "TEST_PATH" }

  specify { expect(request.get(path)['status']).to eq "OK" }
end

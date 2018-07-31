RSpec.describe JSONAPI::RSpec, '#have_included' do
  context 'when providing no value' do
    it 'succeeds when included is present' do
      expect('included' => {}).to have_included
    end

    it 'fails when included is absent' do
      expect({}).not_to have_included
    end
  end

  context 'when providing a value' do
    it 'succeeds when included matches' do
      expect('included' => [{ 'id' => '1', 'type' => 'record' }]).to have_included(id: '1', type: 'record')
    end

    it 'fails when included mismatches' do
      expect('included' => [{ 'id' => '1', 'type' => 'record' }]).not_to have_included(id: '1', type: 'album')
    end

    it 'fails when included is absent' do
      expect({}).not_to have_included(foo: 'bar')
    end
  end
end

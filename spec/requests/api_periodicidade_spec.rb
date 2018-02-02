require 'rails_helper'

describe 'Periodicities - ', type: :request do
  context 'Listing' do
    it 'request only one periodicity' do
      periodicity = create(:periodicity)

      get api_periodicities_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(periodicity.id)
      expect(data[0]['name']).to eq(periodicity.name)
      expect(data[0]['period']).to eq(periodicity.period)
    end
    it 'response 200 and a message to empty periodicity' do
      get api_periodicities_path
      data = JSON.parse(response.body)

      expect(data['message']).to eq 'Nenhuma periodicidade encontrada'
      expect(response.status).to eq 200
    end
    it 'show two periodicity' do
      periodicity = create(:periodicity)
      periodicity2 = create(:periodicity, name: 'Anual', period: 12)

      get api_periodicities_path
      data = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(data[0]['id']).to eq(periodicity.id)
      expect(data[0]['name']).to eq(periodicity.name)
      expect(data[0]['period']).to eq(periodicity.period)
      expect(data[1]['id']).to eq(periodicity2.id)
      expect(data[1]['name']).to eq(periodicity2.name)
      expect(data[1]['period']).to eq(periodicity2.period)
    end
  end
end

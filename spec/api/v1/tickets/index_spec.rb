require 'rails_helper'

RSpec.describe "tickets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tickets", params: params
  end

  describe 'basic fetch' do
    let!(:ticket1) { create(:ticket) }
    let!(:ticket2) { create(:ticket) }

    it 'works' do
      expect(TicketResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['tickets'])
      expect(d.map(&:id)).to match_array([ticket1.id, ticket2.id])
    end
  end
end

require 'rails_helper'

RSpec.describe "bought_tickets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bought_tickets/#{bought_ticket.id}", params: params
  end

  describe 'basic fetch' do
    let!(:bought_ticket) { create(:bought_ticket) }

    it 'works' do
      expect(BoughtTicketResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('bought_tickets')
      expect(d.id).to eq(bought_ticket.id)
    end
  end
end

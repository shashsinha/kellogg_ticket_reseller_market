require 'rails_helper'

RSpec.describe "bought_tickets#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/bought_tickets", params: params
  end

  describe 'basic fetch' do
    let!(:bought_ticket1) { create(:bought_ticket) }
    let!(:bought_ticket2) { create(:bought_ticket) }

    it 'works' do
      expect(BoughtTicketResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['bought_tickets'])
      expect(d.map(&:id)).to match_array([bought_ticket1.id, bought_ticket2.id])
    end
  end
end

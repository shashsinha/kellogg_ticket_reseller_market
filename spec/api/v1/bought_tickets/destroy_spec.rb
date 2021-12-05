require 'rails_helper'

RSpec.describe "bought_tickets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/bought_tickets/#{bought_ticket.id}"
  end

  describe 'basic destroy' do
    let!(:bought_ticket) { create(:bought_ticket) }

    it 'updates the resource' do
      expect(BoughtTicketResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { BoughtTicket.count }.by(-1)
      expect { bought_ticket.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

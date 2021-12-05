require 'rails_helper'

RSpec.describe "bought_tickets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/bought_tickets/#{bought_ticket.id}", payload
  end

  describe 'basic update' do
    let!(:bought_ticket) { create(:bought_ticket) }

    let(:payload) do
      {
        data: {
          id: bought_ticket.id.to_s,
          type: 'bought_tickets',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(BoughtTicketResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { bought_ticket.reload.attributes }
    end
  end
end

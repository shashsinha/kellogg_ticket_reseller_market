require 'rails_helper'

RSpec.describe "bought_tickets#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/bought_tickets", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'bought_tickets',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(BoughtTicketResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { BoughtTicket.count }.by(1)
    end
  end
end

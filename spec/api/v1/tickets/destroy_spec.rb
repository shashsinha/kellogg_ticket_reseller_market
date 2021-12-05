require 'rails_helper'

RSpec.describe "tickets#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/tickets/#{ticket.id}"
  end

  describe 'basic destroy' do
    let!(:ticket) { create(:ticket) }

    it 'updates the resource' do
      expect(TicketResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Ticket.count }.by(-1)
      expect { ticket.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

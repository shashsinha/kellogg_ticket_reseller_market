require "rails_helper"

RSpec.describe "tickets#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/tickets/#{ticket.id}", payload
  end

  describe "basic update" do
    let!(:ticket) { create(:ticket) }

    let(:payload) do
      {
        data: {
          id: ticket.id.to_s,
          type: "tickets",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(TicketResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ticket.reload.attributes }
    end
  end
end

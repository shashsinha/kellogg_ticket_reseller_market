require "rails_helper"

RSpec.describe "tickets#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/tickets", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "tickets",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(TicketResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { Ticket.count }.by(1)
    end
  end
end

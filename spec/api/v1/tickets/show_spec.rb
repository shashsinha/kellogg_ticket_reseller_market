require "rails_helper"

RSpec.describe "tickets#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/tickets/#{ticket.id}", params: params
  end

  describe "basic fetch" do
    let!(:ticket) { create(:ticket) }

    it "works" do
      expect(TicketResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("tickets")
      expect(d.id).to eq(ticket.id)
    end
  end
end

require "rails_helper"

RSpec.describe "auction_bids#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/auction_bids", payload
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
          type: "auction_bids",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(AuctionBidResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { AuctionBid.count }.by(1)
    end
  end
end

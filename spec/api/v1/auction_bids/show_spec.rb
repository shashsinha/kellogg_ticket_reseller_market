require "rails_helper"

RSpec.describe "auction_bids#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/auction_bids/#{auction_bid.id}", params: params
  end

  describe "basic fetch" do
    let!(:auction_bid) { create(:auction_bid) }

    it "works" do
      expect(AuctionBidResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("auction_bids")
      expect(d.id).to eq(auction_bid.id)
    end
  end
end

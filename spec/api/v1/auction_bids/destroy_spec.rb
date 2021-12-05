require "rails_helper"

RSpec.describe "auction_bids#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/auction_bids/#{auction_bid.id}"
  end

  describe "basic destroy" do
    let!(:auction_bid) { create(:auction_bid) }

    it "updates the resource" do
      expect(AuctionBidResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { AuctionBid.count }.by(-1)
      expect { auction_bid.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end

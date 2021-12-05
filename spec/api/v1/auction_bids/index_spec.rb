require "rails_helper"

RSpec.describe "auction_bids#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/auction_bids", params: params
  end

  describe "basic fetch" do
    let!(:auction_bid1) { create(:auction_bid) }
    let!(:auction_bid2) { create(:auction_bid) }

    it "works" do
      expect(AuctionBidResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["auction_bids"])
      expect(d.map(&:id)).to match_array([auction_bid1.id, auction_bid2.id])
    end
  end
end

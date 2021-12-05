require 'rails_helper'

RSpec.describe "auction_bids#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/auction_bids/#{auction_bid.id}", payload
  end

  describe 'basic update' do
    let!(:auction_bid) { create(:auction_bid) }

    let(:payload) do
      {
        data: {
          id: auction_bid.id.to_s,
          type: 'auction_bids',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(AuctionBidResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { auction_bid.reload.attributes }
    end
  end
end

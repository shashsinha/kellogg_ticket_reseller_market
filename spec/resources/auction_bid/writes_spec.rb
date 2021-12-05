require "rails_helper"

RSpec.describe AuctionBidResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "auction_bids",
          attributes: {},
        },
      }
    end

    let(:instance) do
      AuctionBidResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { AuctionBid.count }.by(1)
    end
  end

  describe "updating" do
    let!(:auction_bid) { create(:auction_bid) }

    let(:payload) do
      {
        data: {
          id: auction_bid.id.to_s,
          type: "auction_bids",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      AuctionBidResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { auction_bid.reload.updated_at }
      # .and change { auction_bid.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:auction_bid) { create(:auction_bid) }

    let(:instance) do
      AuctionBidResource.find(id: auction_bid.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { AuctionBid.count }.by(-1)
    end
  end
end

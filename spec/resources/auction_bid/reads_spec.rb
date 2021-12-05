require "rails_helper"

RSpec.describe AuctionBidResource, type: :resource do
  describe "serialization" do
    let!(:auction_bid) { create(:auction_bid) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(auction_bid.id)
      expect(data.jsonapi_type).to eq("auction_bids")
    end
  end

  describe "filtering" do
    let!(:auction_bid1) { create(:auction_bid) }
    let!(:auction_bid2) { create(:auction_bid) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: auction_bid2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([auction_bid2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:auction_bid1) { create(:auction_bid) }
      let!(:auction_bid2) { create(:auction_bid) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      auction_bid1.id,
                                      auction_bid2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      auction_bid2.id,
                                      auction_bid1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

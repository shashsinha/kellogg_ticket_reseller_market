class Api::V1::AuctionBidsController < Api::V1::GraphitiController
  def index
    auction_bids = AuctionBidResource.all(params)
    respond_with(auction_bids)
  end

  def show
    auction_bid = AuctionBidResource.find(params)
    respond_with(auction_bid)
  end

  def create
    auction_bid = AuctionBidResource.build(params)

    if auction_bid.save
      render jsonapi: auction_bid, status: 201
    else
      render jsonapi_errors: auction_bid
    end
  end

  def update
    auction_bid = AuctionBidResource.find(params)

    if auction_bid.update_attributes
      render jsonapi: auction_bid
    else
      render jsonapi_errors: auction_bid
    end
  end

  def destroy
    auction_bid = AuctionBidResource.find(params)

    if auction_bid.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: auction_bid
    end
  end
end

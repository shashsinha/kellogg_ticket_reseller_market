class AuctionBidsController < ApplicationController
  before_action :set_auction_bid, only: [:show, :edit, :update, :destroy]

  # GET /auction_bids
  def index
    @auction_bids = AuctionBid.all
  end

  # GET /auction_bids/1
  def show
  end

  # GET /auction_bids/new
  def new
    @auction_bid = AuctionBid.new
  end

  # GET /auction_bids/1/edit
  def edit
  end

  # POST /auction_bids
  def create
    @auction_bid = AuctionBid.new(auction_bid_params)

    if @auction_bid.save
      redirect_to @auction_bid, notice: 'Auction bid was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /auction_bids/1
  def update
    if @auction_bid.update(auction_bid_params)
      redirect_to @auction_bid, notice: 'Auction bid was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /auction_bids/1
  def destroy
    @auction_bid.destroy
    redirect_to auction_bids_url, notice: 'Auction bid was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction_bid
      @auction_bid = AuctionBid.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def auction_bid_params
      params.require(:auction_bid).permit(:ticket_id, :bid_by_id)
    end
end

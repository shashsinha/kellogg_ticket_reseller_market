class AuctionBidsController < ApplicationController
  before_action :set_auction_bid, only: %i[show edit update destroy]

  def index
    @q = AuctionBid.ransack(params[:q])
    @auction_bids = @q.result(distinct: true).includes(:bid_by,
                                                       :ticket).page(params[:page]).per(10)
  end

  def show; end

  def new
    @auction_bid = AuctionBid.new
  end

  def edit; end

  def create
    @auction_bid = AuctionBid.new(auction_bid_params)

    if @auction_bid.save
      message = "AuctionBid was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @auction_bid, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @auction_bid.update(auction_bid_params)
      redirect_to @auction_bid, notice: "Auction bid was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @auction_bid.destroy
    message = "AuctionBid was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to auction_bids_url, notice: message
    end
  end

  private

  def set_auction_bid
    @auction_bid = AuctionBid.find(params[:id])
  end

  def auction_bid_params
    params.require(:auction_bid).permit(:ticket_id, :bid_by_id)
  end
end

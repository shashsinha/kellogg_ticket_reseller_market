require "rails_helper"

RSpec.describe AuctionBid, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ticket) }

    it { should belong_to(:bid_by) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

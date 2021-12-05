require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:auction_bids) }

    it { should have_many(:bought_tickets) }

    it { should have_many(:events) }

    it { should have_many(:tickets) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

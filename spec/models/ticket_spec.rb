require 'rails_helper'

RSpec.describe Ticket, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:event) }

    it { should have_many(:auction_bids) }

    it { should have_many(:bought_tickets) }

    it { should belong_to(:sold_by) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

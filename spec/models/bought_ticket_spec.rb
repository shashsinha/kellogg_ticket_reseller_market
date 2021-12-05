require "rails_helper"

RSpec.describe BoughtTicket, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:ticket_bought) }

    it { should belong_to(:bought_by) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

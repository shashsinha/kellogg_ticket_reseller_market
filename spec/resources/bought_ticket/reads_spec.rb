require "rails_helper"

RSpec.describe BoughtTicketResource, type: :resource do
  describe "serialization" do
    let!(:bought_ticket) { create(:bought_ticket) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(bought_ticket.id)
      expect(data.jsonapi_type).to eq("bought_tickets")
    end
  end

  describe "filtering" do
    let!(:bought_ticket1) { create(:bought_ticket) }
    let!(:bought_ticket2) { create(:bought_ticket) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: bought_ticket2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([bought_ticket2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:bought_ticket1) { create(:bought_ticket) }
      let!(:bought_ticket2) { create(:bought_ticket) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      bought_ticket1.id,
                                      bought_ticket2.id,
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
                                      bought_ticket2.id,
                                      bought_ticket1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

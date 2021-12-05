require "rails_helper"

RSpec.describe TicketResource, type: :resource do
  describe "serialization" do
    let!(:ticket) { create(:ticket) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ticket.id)
      expect(data.jsonapi_type).to eq("tickets")
    end
  end

  describe "filtering" do
    let!(:ticket1) { create(:ticket) }
    let!(:ticket2) { create(:ticket) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ticket2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ticket2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ticket1) { create(:ticket) }
      let!(:ticket2) { create(:ticket) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ticket1.id,
                                      ticket2.id,
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
                                      ticket2.id,
                                      ticket1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

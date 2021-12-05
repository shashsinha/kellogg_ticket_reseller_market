require "rails_helper"

RSpec.describe EventCategoryResource, type: :resource do
  describe "serialization" do
    let!(:event_category) { create(:event_category) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(event_category.id)
      expect(data.jsonapi_type).to eq("event_categories")
    end
  end

  describe "filtering" do
    let!(:event_category1) { create(:event_category) }
    let!(:event_category2) { create(:event_category) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: event_category2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([event_category2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:event_category1) { create(:event_category) }
      let!(:event_category2) { create(:event_category) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      event_category1.id,
                                      event_category2.id,
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
                                      event_category2.id,
                                      event_category1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end

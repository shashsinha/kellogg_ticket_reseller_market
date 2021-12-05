require "rails_helper"

RSpec.describe "event_categories#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_categories", params: params
  end

  describe "basic fetch" do
    let!(:event_category1) { create(:event_category) }
    let!(:event_category2) { create(:event_category) }

    it "works" do
      expect(EventCategoryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["event_categories"])
      expect(d.map(&:id)).to match_array([event_category1.id,
                                          event_category2.id])
    end
  end
end

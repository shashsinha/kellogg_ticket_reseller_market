require "rails_helper"

RSpec.describe "event_categories#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/event_categories/#{event_category.id}", params: params
  end

  describe "basic fetch" do
    let!(:event_category) { create(:event_category) }

    it "works" do
      expect(EventCategoryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("event_categories")
      expect(d.id).to eq(event_category.id)
    end
  end
end

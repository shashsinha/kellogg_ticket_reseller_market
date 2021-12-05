require "rails_helper"

RSpec.describe "event_categories#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/event_categories/#{event_category.id}", payload
  end

  describe "basic update" do
    let!(:event_category) { create(:event_category) }

    let(:payload) do
      {
        data: {
          id: event_category.id.to_s,
          type: "event_categories",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(EventCategoryResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { event_category.reload.attributes }
    end
  end
end

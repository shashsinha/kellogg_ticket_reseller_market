require 'rails_helper'

RSpec.describe "event_categories#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/event_categories/#{event_category.id}"
  end

  describe 'basic destroy' do
    let!(:event_category) { create(:event_category) }

    it 'updates the resource' do
      expect(EventCategoryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { EventCategory.count }.by(-1)
      expect { event_category.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end

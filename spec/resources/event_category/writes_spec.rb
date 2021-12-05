require 'rails_helper'

RSpec.describe EventCategoryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'event_categories',
          attributes: { }
        }
      }
    end

    let(:instance) do
      EventCategoryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { EventCategory.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:event_category) { create(:event_category) }

    let(:payload) do
      {
        data: {
          id: event_category.id.to_s,
          type: 'event_categories',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      EventCategoryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { event_category.reload.updated_at }
      # .and change { event_category.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:event_category) { create(:event_category) }

    let(:instance) do
      EventCategoryResource.find(id: event_category.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { EventCategory.count }.by(-1)
    end
  end
end

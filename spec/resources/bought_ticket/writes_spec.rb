require 'rails_helper'

RSpec.describe BoughtTicketResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'bought_tickets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BoughtTicketResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { BoughtTicket.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:bought_ticket) { create(:bought_ticket) }

    let(:payload) do
      {
        data: {
          id: bought_ticket.id.to_s,
          type: 'bought_tickets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BoughtTicketResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { bought_ticket.reload.updated_at }
      # .and change { bought_ticket.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:bought_ticket) { create(:bought_ticket) }

    let(:instance) do
      BoughtTicketResource.find(id: bought_ticket.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { BoughtTicket.count }.by(-1)
    end
  end
end

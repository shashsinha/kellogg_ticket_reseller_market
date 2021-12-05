require 'rails_helper'

RSpec.describe TicketResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'tickets',
          attributes: { }
        }
      }
    end

    let(:instance) do
      TicketResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Ticket.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ticket) { create(:ticket) }

    let(:payload) do
      {
        data: {
          id: ticket.id.to_s,
          type: 'tickets',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      TicketResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ticket.reload.updated_at }
      # .and change { ticket.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ticket) { create(:ticket) }

    let(:instance) do
      TicketResource.find(id: ticket.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Ticket.count }.by(-1)
    end
  end
end

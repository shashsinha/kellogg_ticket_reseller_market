require 'rails_helper'

RSpec.describe Event, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:event_category) }

    it { should have_many(:tickets) }

    it { should belong_to(:created_by) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

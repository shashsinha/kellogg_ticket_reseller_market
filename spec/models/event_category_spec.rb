require "rails_helper"

RSpec.describe EventCategory, type: :model do
  describe "Direct Associations" do
    it { should have_many(:events) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

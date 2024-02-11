require 'rails_helper'

RSpec.describe Shipment, type: :model do

  it "creates a valid shipment" do
    shipment = create(:shipment)
    expect(shipment).to be_valid
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:delivery_partner).class_name('User').with_foreign_key('delivery_partner_id').optional }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values([:pending, :in_transit, :delivered]) }
  end

  describe "validations" do
    it { should validate_presence_of(:source_location) }
    it { should validate_presence_of(:target_location) }
    it { should validate_presence_of(:item) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(Shipment::STATUSES) }
  end

  describe "associations" do
    it { should belong_to(:user).with_foreign_key(:user_id) }
    it { should belong_to(:delivery_partner).class_name('User').with_foreign_key(:delivery_partner_id).optional }
  end

  describe "scopes" do
    describe ".assigned_to" do
      let(:user) { create(:user) }
      let(:shipment1) { create(:shipment, user: user) }
      let(:shipment2) { create(:shipment, user: user, delivery_partner: nil) }
      let(:shipment3) { create(:shipment, user: user, delivery_partner: create(:user, role: :delivery_partner)) }

      it "returns shipments assigned to a specific user" do
        expect(Shipment.assigned_to(user)).to match_array([shipment1, shipment3])
      end
    end
  end
end

# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do

  it "creates a valid user" do
    user = create(:user)
    expect(user).to be_valid
  end
  
  describe "associations" do
    it { should have_many(:shipments).with_foreign_key(:user_id) }
    it { should have_many(:assigned_shipments).class_name('Shipment').with_foreign_key(:delivery_partner_id) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe "active_for_authentication?" do
    it "returns true for admin user" do
      admin_user = FactoryBot.create(:user, role: :admin)
      expect(admin_user.active_for_authentication?).to be_truthy
    end

    it "returns false for non-admin user if not onboarded" do
      user = FactoryBot.create(:user, role: :customer, onboarded: false)
      expect(user.active_for_authentication?).to be_falsey
    end

    it "returns true for non-admin user if onboarded" do
      user = FactoryBot.create(:user, role: :customer, onboarded: true)
      expect(user.active_for_authentication?).to be_truthy
    end
  end
end

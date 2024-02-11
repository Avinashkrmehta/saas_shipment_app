class Shipment < ApplicationRecord
	enum status: [:pending, :in_transit, :delivered]

  belongs_to :user
  belongs_to :delivery_partner, class_name: 'User', foreign_key: 'delivery_partner_id', optional: true

  validates :source_location, :target_location, :item, presence: true
end

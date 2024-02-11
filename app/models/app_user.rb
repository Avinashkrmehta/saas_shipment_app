class AppUser < User
	scope :delivery_partners, -> { where( role: 'delivery_partner' ) }
	scope :customers, -> { where( role: 'customer' ) }
	scope :customers_and_delivery_partners, -> { where(role: [roles[:customer], roles[:delivery_partner]]) }
end

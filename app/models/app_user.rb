class AppUser < User
	scope :delivery_partners, -> { where( role: 'delivery_partner' ) }
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	enum role: { customer: 2, delivery_partner: 1, admin: 0 }

  has_many :shipments, foreign_key: :user_id
  has_many :delivery_partners, class_name: 'Shipment', foreign_key: :delivery_partner_id

  def active_for_authentication?
  	if self.role == 'admin'
    	super
    else
    	super && onboarded?	
	end
  end
end

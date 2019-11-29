class Membership < ApplicationRecord
		has_many :members
		has_many :reservations


end

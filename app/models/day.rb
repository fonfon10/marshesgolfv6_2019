class Day < ApplicationRecord
	has_many :reservations
	belongs_to :open_close
end

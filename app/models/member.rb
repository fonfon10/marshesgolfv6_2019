class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable

  validates_presence_of :firstname, :lastname, :email

	belongs_to :membership
	belongs_to :age_group
	has_many :reservations



def operator?
	self.membership.name == "Operator"
end

def admin?
	self.membership.name == "Admin"
end



end

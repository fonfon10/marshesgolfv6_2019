class MembershipsController < InheritedResources::Base
before_action :authenticate_member!


def membership_to_operator
	@member = Member.find_by firstname: "Serge"
	operator_status = Membership.find_by name: "Operator"

	@member.update(membership: operator_status)
  @member.save
  redirect_to root_path
end

def membership_to_coaching
	@member = Member.find_by firstname: "Serge"
	operator_status = Membership.find_by name: "Coaching"

	@member.update(membership: operator_status)
  @member.save
  redirect_to root_path
end

def membership_to_practice
	@member = Member.find_by firstname: "Serge"
	operator_status = Membership.find_by name: "Practice"

	@member.update(membership: operator_status)
  @member.save
  redirect_to root_path
end

def membership_to_admin
	@member = Member.find_by firstname: "Serge"
	operator_status = Membership.find_by name: "Admin"

	@member.update(membership: operator_status)
  @member.save
  redirect_to root_path
end




  private

    def membership_params
      params.require(:membership).permit(:name)
    end
end


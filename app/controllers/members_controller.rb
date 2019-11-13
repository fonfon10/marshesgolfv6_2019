class MembersController < InheritedResources::Base
before_action :authenticate_member!



def new
  @member = Member.new
  @age_groups = AgeGroup.order('name ASC').map { |i| [i.name, i.id]}
  @memberships = Membership.order('name ASC').map { |i| [i.name, i.id]}

end

def create
  @member = Member.new(member_params)
  @member.password = ("golf123")
  @member.password_confirmation = ("golf123")

  if @member.save
    redirect_to members_path
  else
    render 'new'
  end
  
end




  private

    def member_params
      params.require(:member).permit(:firstname, :lastname, :email, :age_group_id, :membership_id)
    end
end


class MembersController < InheritedResources::Base

  private

    def member_params
      params.require(:member).permit(:name, :age_group_id, :membership_id, :lesson)
    end

end

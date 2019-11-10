class MembershipsController < InheritedResources::Base
before_action :authenticate_member!

  private

    def membership_params
      params.require(:membership).permit(:name)
    end

end

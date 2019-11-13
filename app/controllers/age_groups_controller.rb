class AgeGroupsController < InheritedResources::Base

before_action :authenticate_member!


  private

    def age_group_params
      params.require(:age_group).permit(:name)
    end
end


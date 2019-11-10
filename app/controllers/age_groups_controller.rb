class AgeGroupsController < InheritedResources::Base

  private

    def age_group_params
      params.require(:age_group).permit(:name)
    end

end
